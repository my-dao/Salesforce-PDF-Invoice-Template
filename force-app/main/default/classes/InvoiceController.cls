public class InvoiceController {
    
    public List<InvoiceItem> purchaseItems { get; set; }
    public Decimal subtotal { get; private set; }
    public Decimal taxes { get; private set; }
    public Decimal total { get; private set; }
    public String invoiceNo { get; private set; }
    public Date invoiceDate { get; private set; }
    public Date dueDate { get; private set; }
    public paymentInfo paymentDetail  { get; set; }
    public customerInfo customerDetail { get; set; }
        
    public InvoiceController() {
        initializeInvoice();
    }
    
    private void initializeInvoice() {
        loadItems();
        calculateTotals();
        setInvoiceDetails();
    }
    // Load purchased products
    private void loadItems() {
        purchaseItems = new List<InvoiceItem>{
            new InvoiceItem('GenWatt Diesel 1000kW', 1, 15000),
            new InvoiceItem('GenWatt Diesel 200kW', 2, 5000),
            new InvoiceItem('GenWatt Gasoline 2000kW', 3, 25000)
        };
    }

    // Calcualte total amount including taxes
    private void calculateTotals() {
        subtotal = 0;
        for (InvoiceItem item : purchaseItems) {
            subtotal += item.amount;
        }
        taxes = subtotal * 0.10; // 10% tax rate
        total = subtotal + taxes;
    }
    // Set all invoice details
    private void setInvoiceDetails() {
        invoiceNo = '123456';
        invoiceDate  = System.today();
        dueDate = invoiceDate.addDays(14);
        paymentDetail = new paymentInfo();
        customerDetail = new customerInfo ('Oceania USA', '500 Shoreline Park', 'Mountian View','NY','99098', 'USA');
    }

    // Inner class for invoice items
    public class InvoiceItem {
        public String productName { get; set; }
        public Integer quantity { get; set; }
        public Decimal unitPrice { get; set; }
        public Decimal amount { get; set; }

        public InvoiceItem(String productName, Integer quantity, Decimal unitPrice) {
            this.productName = productName;
            this.quantity = quantity;
            this.unitPrice = unitPrice;
            this.amount = quantity * unitPrice;
        }
    }
    // Inner class for payment information
    public class paymentInfo {
        public String paymentAccountName{ get; set; }
        public String paymentAccountNumber{ get; set; }
        public String paymentBankName{ get; set; }
        public String paymentBSBNumber{ get; set; }

        public paymentInfo() {
            this.paymentAccountName ='ABC Company Pty.';
            this.paymentAccountNumber = '123456';
            this.paymentBankName = 'ANZ Bank';
            this.paymentBSBNumber = '666888';
        }
    }
     // Inner class for customer information
    public class  customerInfo{
        public String customerName{ get; set; }
        public String BillingStreet{ get; set; }
        public String BillingCity{ get; set; }
        public String BillingState{ get; set; }
        public String BillingPostalCode{ get; set; }
        public String BillingCountry{ get; set; }

        public customerInfo(String customerName, String BillingStreet, String BillingCity,
                String BillingState, String BillingPostalCode, String BillingCountry) {
            this.customerName = customerName;
            this.BillingStreet = BillingStreet;
            this.BillingCity = BillingCity;
            this.BillingState = BillingState;
            this.BillingPostalCode = BillingPostalCode;
            this.BillingCountry = BillingCountry;
        }
    }
}