From: Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>
Subject: Re: [PATCH 1/3] i2c: tegra: implement slave mode
Date: Tue, 31 Mar 2015 09:25:38 +0300
Message-ID: <551A3DE2.90806@mail.ru>
References: <1422516022-27161-1-git-send-email-danindrey@mail.ru> <1422516022-27161-2-git-send-email-danindrey@mail.ru> <20150129114155.GA9080@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150129114155.GA9080@katana>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

Sorry for long delay.

And thanks for the quick review. It helped a lot!

On 29.01.2015 14:41, Wolfram Sang wrote:
> Hi,
>
>> Initialization code is based on NVEC driver.
>>
>> There is a HW bug in AP20 that was also mentioned in kernel sources
>> for Toshiba AC100.
>>
>> Signed-off-by: Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>
>
> Cool, thanks for the converison. While I usually like to only get the
> patches which I need to handle, please CC me to all patches next time. I
> am interested what changes were needed for the user of the slave
> framework, too.

Done. I sent v2 yesterday evening.
>
>> +static bool tegra_i2c_slave_isr(int irq, struct tegra_i2c_dev *i2c_dev)
>> +{
>> +	unsigned long status;
>> +	u8 value;
>> +
>> +	if (!i2c_dev->slave || !i2c_dev->slave->slave_cb)
>> +		return false;
>
> Can this happen?

Yes. I call slave ISR without any conditions from main ISR routine.
>
>> +	/* i2c master sends data to us */
>> +	if (is_write(status)) {
>> +		i2c_slave_event(i2c_dev->slave, I2C_SLAVE_REQ_WRITE_START,
>> +				NULL);
>
> Can this HW create an interrupt once the address detection + RW bit are
> received? Or only if a complete write has been received?

Tegra I2C generates one interrupt per byte (address or data) and one 
interrupt for stop bit.
>
>> +static int tegra_reg_slave(struct i2c_client *slave)
>> +{
>> +	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(slave->adapter);
>> +
>> +	if (i2c_dev->slave)
>> +		return -EBUSY;
>> +
>> +	i2c_dev->slave = slave;
>> +
>> +	tegra_i2c_clock_enable(i2c_dev);
>> +
>> +	reset_control_assert(i2c_dev->rst);
>> +	udelay(2);
>> +	reset_control_deassert(i2c_dev->rst);
>
> Why do you need a reset when a slave gets registered?

I copied this code from nvec driver. Reset is done during I2C controller 
initialization. This reset is not needed. Thanks for pointing.
>
>> +
>> +	i2c_writel(i2c_dev, I2C_SL_CNFG_NEWSL, I2C_SL_CNFG);
>> +	i2c_writel(i2c_dev, 0x1E, I2C_SL_DELAY_COUNT);
>
> What does this magic number mean?

It's a default value. I created a constant for it.
>
>> +
>> +	i2c_writel(i2c_dev, slave->addr, I2C_SL_ADDR1);
>> +	i2c_writel(i2c_dev, 0, I2C_SL_ADDR2);
>
> Handling 10 bit addresses?

In v2.
>
>> +
>> +	return 0;
>> +}
>> +
>
>>   static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
>> @@ -679,6 +808,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
>>   	.has_single_clk_source = false,
>>   	.clk_divisor_hs_mode = 3,
>>   	.clk_divisor_std_fast_mode = 0,
>> +	.slave_read_start_delay = 0,
>
> No need to init to 0 IMO.
>
Ok.
