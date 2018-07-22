# cuba-example-l10n-date-instancename
CUBA example that shows how to display localized values for dates in the instance name (`@NamePattern`) of an entity.

To do that the `@NamePattern` annotation accepts also method references: 
`@NamePattern("#getCaption|birthday")` which allow to delegate the actual String representation to the method `getCaption`.

## Customer entity

```

@NamePattern("#getCaption|name,birthday")
@Table(name = "CELDI_CUSTOMER")
@Entity(name = "celdi$Customer")
public class Customer extends StandardEntity {
    private static final long serialVersionUID = 1561640237605049941L;

    @Column(name = "NAME")
    protected String name;

    @Temporal(TemporalType.DATE)
    @Column(name = "BIRTHDAY")
    protected Date birthday;

    @Composition
    @OnDelete(DeletePolicy.CASCADE)
    @OneToMany(mappedBy = "customer")
    protected List<Order> orders;

    // ... getters & setters

    public String getCaption() {
        return name + " - " + formatDate(birthday);
    }

    private String formatDate(Date orderDate) {
        return AppBeans.get(DatatypeFormatter.class).formatDate(orderDate);
    }

}
```


## Resulting application

![l10n-date-instancename](https://github.com/mariodavid/cuba-example-l10n-date-instancename/blob/master/img/l10n-date-instancename.gif)
