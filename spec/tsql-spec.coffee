describe "TSQL grammar", ->
  grammar = null

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage("tsql")

    runs ->
      grammar = atom.grammars.grammarForScopeName("source.tsql")

  it "parses the grammar", ->
    expect(grammar).toBeDefined()
    expect(grammar.scopeName).toBe "source.tsql"

  describe "Exact Numerics", ->
    it "will identify a tokenized lined as an exact numeric type", ->
      {tokens} = grammar.tokenizeLine("bigint, numeric, bit, smallint, decimal, smallmoney, int, tinyint, money")
      expect(tokens[0]).toEqual value: 'bigint', scopes: ['source.tsql', 'storage.type.sql']
      expect(tokens[2]).toEqual value: 'numeric', scopes: ['source.tsql', 'storage.type.sql']
      expect(tokens[4]).toEqual value: 'bit', scopes: ['source.tsql', 'storage.type.sql']
      expect(tokens[6]).toEqual value: 'smallint', scopes: ['source.tsql', 'storage.type.sql']
      expect(tokens[8]).toEqual value: 'decimal', scopes: ['source.tsql', 'storage.type.sql']
      expect(tokens[10]).toEqual value: 'smallmoney', scopes: ['source.tsql', 'storage.type.sql']
      expect(tokens[12]).toEqual value: 'int', scopes: ['source.tsql', 'storage.type.sql']
      expect(tokens[14]).toEqual value: 'tinyint', scopes: ['source.tsql', 'storage.type.sql']
      expect(tokens[16]).toEqual value: 'money', scopes: ['source.tsql', 'storage.type.sql']

  describe "Create Keywords", ->
    it "will identify create operator class as a create type keyword", ->
      {tokens} = grammar.tokenizeLine("create operator class x")
      expect(tokens[0]).toEqual value: 'create', scopes: ['source.tsql', 'meta.create.tsql', 'keyword.other.create.tsql']
      expect(tokens[2]).toEqual value: 'operator class', scopes: ['source.tsql', 'meta.create.tsql', 'keyword.other.tsql']
      expect(tokens[4]).toEqual value: 'x', scopes: ['source.tsql', 'meta.create.tsql', 'entity.name.function.tsql']

  describe "built in TSQL Aggregate functions", ->
    it "will identify aggregate functions as TSQL functions", ->
      {tokens} = grammar.tokenizeLine("AVG, MIN, CHECKSUM_AGG, SUM, COUNT, COUNT_BIG, STDEVP, STDEV, GROUPING_ID, VAR, VARP, MAX")
      expect(tokens[0]).toEqual value: 'AVG', scopes: ['source.tsql', 'support.function.aggregate.tsql']
      expect(tokens[2]).toEqual value: 'MIN', scopes: ['source.tsql', 'support.function.aggregate.tsql']
      expect(tokens[4]).toEqual value: 'CHECKSUM_AGG', scopes: ['source.tsql', 'support.function.aggregate.tsql']
      expect(tokens[6]).toEqual value: 'SUM', scopes: ['source.tsql', 'support.function.aggregate.tsql']
      expect(tokens[8]).toEqual value: 'COUNT', scopes: ['source.tsql', 'support.function.aggregate.tsql']
      expect(tokens[10]).toEqual value: 'COUNT_BIG', scopes: ['source.tsql', 'support.function.aggregate.tsql']
      expect(tokens[12]).toEqual value: 'STDEVP', scopes: ['source.tsql', 'support.function.aggregate.tsql']
      expect(tokens[14]).toEqual value: 'STDEV', scopes: ['source.tsql', 'support.function.aggregate.tsql']
      expect(tokens[16]).toEqual value: 'GROUPING_ID', scopes: ['source.tsql', 'support.function.aggregate.tsql']
      expect(tokens[18]).toEqual value: 'VAR', scopes: ['source.tsql', 'support.function.aggregate.tsql']
      expect(tokens[20]).toEqual value: 'VARP', scopes: ['source.tsql', 'support.function.aggregate.tsql']
      expect(tokens[22]).toEqual value: 'MAX', scopes: ['source.tsql', 'support.function.aggregate.tsql']

  #TODO: Complete testing...
