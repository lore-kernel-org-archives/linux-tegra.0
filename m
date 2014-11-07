From: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH v3 10/13] memory: tegra: Add EMC (external memory
 controller) driver
Date: Fri, 7 Nov 2014 17:16:23 +0100
Message-ID: <CAAObsKDW3zcgmFZ1BPLeqV7AwvKbWmPh6fEvhB=4q7r_f5KtSg@mail.gmail.com>
References: <1414599796-30597-1-git-send-email-tomeu.vizoso@collabora.com>
 <1414599796-30597-11-git-send-email-tomeu.vizoso@collabora.com>
 <545B29AA.8030006@nvidia.com> <545B5D15.6030705@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <545B5D15.6030705-/1wQRMveznE@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Bharat Bhushan <bharat.bhushan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Prabhakar Kushwaha <prabhakar-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-kernel@v
List-Id: linux-tegra@vger.kernel.org

On 6 November 2014 12:35, Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org> wrote:
> On 11/06/2014 09:56 AM, Alexandre Courbot wrote:
>>
>> On 10/30/2014 01:22 AM, Tomeu Vizoso wrote:
>>> +static int tegra_emc_probe(struct platform_device *pdev)
>>> +{
>>> +    struct tegra_emc *tegra;
>>> +    struct device_node *node;
>>> +    struct platform_device *mc_pdev;
>>> +    struct resource *res;
>>> +    u32 ram_code, node_ram_code;
>>> +    int err;
>>> +
>>> +    tegra = devm_kzalloc(&pdev->dev, sizeof(*tegra), GFP_KERNEL);
>>> +    if (!tegra)
>>> +        return -ENOMEM;
>>> +
>>> +    tegra->pdev = pdev;
>>> +
>>> +    res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +    tegra->emc_regs = devm_ioremap_resource(&pdev->dev, res);
>>> +    if (IS_ERR(tegra->emc_regs)) {
>>> +        dev_err(&pdev->dev, "failed to map EMC regs\n");
>>> +        return PTR_ERR(tegra->emc_regs);
>>> +    }
>>> +
>>> +    node = of_parse_phandle(pdev->dev.of_node,
>>> +                "nvidia,memory-controller", 0);
>>> +    if (!node) {
>>> +        dev_err(&pdev->dev, "could not get memory controller\n");
>>> +        return -ENOENT;
>>> +    }
>>> +
>>> +    mc_pdev = of_find_device_by_node(node);
>>> +    if (!mc_pdev)
>>> +        return -ENOENT;
>>
>>
>> Isn't there a risk that we will return -ENOENT depending on the probe
>> order? I.e. if this device is probed before the MC device?
>
>
> Yes.. I remember having some trouble with this code. IIRC, I couldn't figure
> out a way to sanely detect if the MC driver had been probed or not. Clearly
> this is not good, though.

Yeah, I found this issue during testing and resorted to
subsys_initcall(). Any better ideas?

Thanks,

Tomeu
