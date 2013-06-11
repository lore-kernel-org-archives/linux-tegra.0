From: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] memory: tegra20-mc: Fix hang in IRQ handler.
Date: Tue, 11 Jun 2013 13:09:39 +0300
Message-ID: <51B6F763.2080004@nvidia.com>
References: <1370855624-30564-1-git-send-email-ttynkkynen@nvidia.com> <1370855624-30564-2-git-send-email-ttynkkynen@nvidia.com> <20130610203641.GA26036@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130610203641.GA26036@mithrandir>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/10/2013 11:36 PM, Thierry Reding wrote:
> On Mon, Jun 10, 2013 at 12:13:43PM +0300, Tuomas Tynkkynen wrote:
>> In Tegra20 memory controller any MC interrupt would cause an
>> infinite loop in the IRQ handler.
>>
>> Signed-off-by: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/memory/tegra20-mc.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/memory/tegra20-mc.c b/drivers/memory/tegra20-mc.c
>> index 2ca5f28..bd5a553 100644
>> --- a/drivers/memory/tegra20-mc.c
>> +++ b/drivers/memory/tegra20-mc.c
>> @@ -193,8 +193,11 @@ static irqreturn_t tegra20_mc_isr(int irq, void *data)
>>  	mask &= stat;
>>  	if (!mask)
>>  		return IRQ_NONE;
>> -	while ((bit = ffs(mask)) != 0)
>> +	while ((bit = ffs(mask)) != 0) {
>>  		tegra20_mc_decode(mc, bit - 1);
>> +		mask &= BIT(bit);
> 
> Shouldn't this be "mask &= ~BIT(bit);"? The intent of the code is to
> clear the bit which was handled by the loop body, right? The above
> clears all other bits instead.
> 
> Thierry

Whoops, yes it should be clearing just one bit. And since ffs() returned
a one-based bit-index, it seemed to work in practice.

I'll fix those & resend.

- Tuomas
