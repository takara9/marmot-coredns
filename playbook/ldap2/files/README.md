# セットアップ方法


## 初期情報のリスト表示

ldapsearch -x -b '' -s base '(objectclass=*)' namingContexts



## 登録

パスワードの固定入力で登録

ldapadd -x -w secret -D "cn=Manager,dc=labo,dc=local" -f org.ldif
ldapadd -x -w secret -D "cn=Manager,dc=labo,dc=local" -f org-unit.ldif
ldapadd -x -w secret -D "cn=Manager,dc=labo,dc=local" -f user1.ldif 
ldapadd -x -w secret -D "cn=Manager,dc=labo,dc=local" -f user2.ldif
ldapadd -x -w secret -D "cn=Manager,dc=labo,dc=local" -f user3.ldif  


対話型パスワードの入力

ldapadd -x -D "cn=Manager,dc=labo,dc=local" -W -f org.ldif



登録の結果の確認

ldapsearch -x -b 'dc=labo,dc=local' '(objectclass=*)'




