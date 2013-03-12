From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2] ARM: tegra: expose chip ID and revision
Date: Tue, 12 Mar 2013 12:04:28 -0600
Message-ID: <513F6E2C.1000101@wwwdotorg.org>
References: <1363089667-15737-1-git-send-email-dahuang@nvidia.com> <201303121259.18710.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201303121259.18710.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Danny Huang <dahuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/12/2013 06:59 AM, Arnd Bergmann wrote:
> On Tuesday 12 March 2013, Danny Huang wrote:
>>
>> +void __init tegra_soc_device_init(void)
>> +{
>> +       struct soc_device *soc_dev;
>> +       struct soc_device_attribute *soc_dev_attr;
>> +
>> +       soc_dev_attr = kzalloc(sizeof(*soc_dev_attr), GFP_KERNEL);
>> +       if (!soc_dev_attr)
>> +               return;
>> +
>> +       soc_dev_attr->soc_id = kasprintf(GFP_KERNEL, "%d", tegra_chip_id);
>> +       soc_dev_attr->revision = kasprintf(GFP_KERNEL, "%d", tegra_revision);
>> +       soc_dev_attr->family = kasprintf(GFP_KERNEL, "Tegra");
>> +
>> +       soc_dev = soc_device_register(soc_dev_attr);
>> +       if (IS_ERR_OR_NULL(soc_dev))
>> +               kfree(soc_dev_attr);
>> +
>> +       return;
> 
> You are dropping the soc_dev on the floor here by just returning.
> 
> The idea of the soc node is to have all on-soc components be children
> of that node, so you should instead pass it into of_platform_populate
> as the parent device.

Tegra DTs don't have a separate node for on-soc vs. off-soc components.
Wouldn't passing soc_dev into of_platform_populate() make everything a
child of this soc_dev; is that what we want?
