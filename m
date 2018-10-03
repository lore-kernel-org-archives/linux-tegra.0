From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH V2 3/5] usb: xhci: tegra: Add genpd support
Date: Wed, 3 Oct 2018 14:44:10 +0100
Message-ID: <4f532f84-4991-6916-b53d-036e7e98be97@nvidia.com>
References: <1538143910-24400-1-git-send-email-jonathanh@nvidia.com>
 <1538143910-24400-4-git-send-email-jonathanh@nvidia.com>
 <CAPDyKFrfcQX0-QrMKy=E=rif9-SjSfxc+LTMBUn5oqOquRdqRg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPDyKFrfcQX0-QrMKy=E=rif9-SjSfxc+LTMBUn5oqOquRdqRg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 03/10/18 10:52, Ulf Hansson wrote:
> [...]
> 
>>  static int tegra_xusb_probe(struct platform_device *pdev)
>>  {
>>         struct tegra_xusb_mbox_msg msg;
>> @@ -1038,7 +1095,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>>                 goto put_padctl;
>>         }
>>
>> -       if (!pdev->dev.pm_domain) {
>> +       if (!of_property_read_bool(pdev->dev.of_node, "power-domains")) {
> 
> I am assuming the original check was because allowing the two
> power-domains to be (wrongly) modeled as one (or as a
> master+subdomain)?

Actually, the original check was added to prepare for supporting
multiple power-domains and that once we had proper support in place the
'pdev->dev.domain' would then be populated. However, given that this is
not used in the case of multiple power-domains, I simply changed the test.

> I was thinking that, perhaps we should add a new OF helper function,
> where one can get the number of specifiers being listed in the
> power-domains property. Would that help to easier distinguish what to
> do when dealing with backwards compatibility?

We could do, but it is not necessary here, because we never had any form
of genpd support for the Tegra xHCI driver.

Cheers
Jon

-- 
nvpublic
