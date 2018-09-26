From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 1/5] PM / Domains: Export symbol for
 genpd_dev_pm_attach_by_name
Date: Wed, 26 Sep 2018 16:02:07 +0100
Message-ID: <afd04dd4-4199-9bb8-1b21-11444bb1773a@nvidia.com>
References: <1537964858-30332-1-git-send-email-jonathanh@nvidia.com>
 <1537964858-30332-2-git-send-email-jonathanh@nvidia.com>
 <CAPDyKFrtw1aYg5QbgRi_jp-xd0VLNeRYhb4HvX4P3AfGjgO0VA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPDyKFrtw1aYg5QbgRi_jp-xd0VLNeRYhb4HvX4P3AfGjgO0VA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Thierry Reding <thierry.reding@gmail.com>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 26/09/18 15:09, Ulf Hansson wrote:
> On 26 September 2018 at 14:27, Jon Hunter <jonathanh@nvidia.com> wrote:
>> Export the symbol for genpd_dev_pm_attach_by_name() so that drivers
>> built as modules can call this function.
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>  drivers/base/power/domain.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
>> index 4b5714199490..b2bbe0d848d2 100644
>> --- a/drivers/base/power/domain.c
>> +++ b/drivers/base/power/domain.c
>> @@ -2397,6 +2397,7 @@ struct device *genpd_dev_pm_attach_by_name(struct device *dev, char *name)
>>
>>         return genpd_dev_pm_attach_by_id(dev, index);
>>  }
>> +EXPORT_SYMBOL_GPL(genpd_dev_pm_attach_by_name);
> 
> Driver's shouldn't be calling this function, but instead use
> dev_pm_domain_attach_by_name().
> 
> Is there any problem with that?

No not at all. Yes that works, sorry it had been a while since I looked
at this and managed to balls it up. OK, I will drop this and correct the
API used by the driver.

Cheers!
Jon

-- 
nvpublic
