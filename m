From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH V4 13/18] soc/tegra: pmc: allow support for more tegra
 wake
Date: Mon, 24 Jun 2019 09:21:41 -0700
Message-ID: <dc320c81-6601-4e6d-a7a0-57df8771bd99@nvidia.com>
References: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
 <1561345379-2429-14-git-send-email-skomatineni@nvidia.com>
 <86d0j3pfga.wl-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <86d0j3pfga.wl-marc.zyngier@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 6/24/19 1:15 AM, Marc Zyngier wrote:
> On Mon, 24 Jun 2019 04:02:54 +0100,
> Sowjanya Komatineni <skomatineni@nvidia.com> wrote:
>> This patch allows to create separate irq_set_wake and irq_set_type
>> implementations for different tegra designs PMC that has different
>> wake models which require difference wake registers and different
>> programming sequence.
>>
>> AOWAKE model support is available for Tegra186 and Tegra194 only
>> and it resides within PMC and supports tiered wake architecture.
>>
>> Tegra210 and prior tegra designs uses PMC directly to receive wake
>> events and coordinate the wake sequence.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/soc/tegra/pmc.c | 14 ++++++++++----
>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>> index edd4fe06810f..e87f29a35fcf 100644
>> --- a/drivers/soc/tegra/pmc.c
>> +++ b/drivers/soc/tegra/pmc.c
>> @@ -226,6 +226,8 @@ struct tegra_pmc_soc {
>>   	void (*setup_irq_polarity)(struct tegra_pmc *pmc,
>>   				   struct device_node *np,
>>   				   bool invert);
>> +	int (*irq_set_wake)(struct irq_data *data, unsigned int on);
>> +	int (*irq_set_type)(struct irq_data *data, unsigned int type);
>>   
>>   	const char * const *reset_sources;
>>   	unsigned int num_reset_sources;
>> @@ -1919,7 +1921,7 @@ static const struct irq_domain_ops tegra_pmc_irq_domain_ops = {
>>   	.alloc = tegra_pmc_irq_alloc,
>>   };
>>   
>> -static int tegra_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>> +static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>>   {
>>   	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
>>   	unsigned int offset, bit;
>> @@ -1951,7 +1953,7 @@ static int tegra_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>>   	return 0;
>>   }
>>   
>> -static int tegra_pmc_irq_set_type(struct irq_data *data, unsigned int type)
>> +static int tegra186_pmc_irq_set_type(struct irq_data *data, unsigned int type)
>>   {
>>   	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
>>   	u32 value;
>> @@ -2005,8 +2007,10 @@ static int tegra_pmc_irq_init(struct tegra_pmc *pmc)
>>   	pmc->irq.irq_unmask = irq_chip_unmask_parent;
>>   	pmc->irq.irq_eoi = irq_chip_eoi_parent;
>>   	pmc->irq.irq_set_affinity = irq_chip_set_affinity_parent;
>> -	pmc->irq.irq_set_type = tegra_pmc_irq_set_type;
>> -	pmc->irq.irq_set_wake = tegra_pmc_irq_set_wake;
>> +	if (pmc->soc->irq_set_type)
>> +		pmc->irq.irq_set_type = pmc->soc->irq_set_type;
>> +	if (pmc->soc->irq_set_wake)
>> +		pmc->irq.irq_set_wake = pmc->soc->irq_set_wake;
> I already commented on how superfluous these 'if ()' where. If you
> disagree, please let me know why.
>
> Thanks,
>
> 	M.

Sorry Marc, missed it. Will fix in next version...


Thanks

Sowjanya
