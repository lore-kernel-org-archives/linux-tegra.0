From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH V2 3/5] usb: xhci: tegra: Add genpd support
Date: Fri, 12 Oct 2018 09:41:35 +0100
Message-ID: <248afd79-1a7d-7342-5939-6fa998d04d5b@nvidia.com>
References: <1538143910-24400-1-git-send-email-jonathanh@nvidia.com>
 <1538143910-24400-4-git-send-email-jonathanh@nvidia.com>
 <20181011164753.GA7393@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181011164753.GA7393@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
List-Id: linux-tegra@vger.kernel.org


On 11/10/18 17:47, Thierry Reding wrote:
> On Fri, Sep 28, 2018 at 03:11:48PM +0100, Jon Hunter wrote:
>> The generic power-domain framework has been updated to allow devices
>> that require more than one power-domain to create a new device for
>> each power-domain required and then link these new power-domain
>> devices to the consumer device.
>>
>> Update the Tegra xHCI driver to use the new APIs provided by the
>> generic power-domain framework so we can use the generic power-domain
>> framework for managing the xHCI controllers power-domains. Please
>> note that to maintain backward compatibility with older device-tree
>> blobs these new generic power-domain APIs are only used if the
>> 'power-domains' property is present and otherwise we fall back to
>> using the legacy Tegra APIs for managing the power-domains.
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>  drivers/usb/host/xhci-tegra.c | 89 +++++++++++++++++++++++++++++++++++++------
>>  1 file changed, 77 insertions(+), 12 deletions(-)
> 
> It'd be nice if we could eventually get rid of the legacy Tegra APIs,
> but that's a separate issue, and this patch looks fine as-is:

Unfortunately, I don't think it is possible as it will break DT backward
compatibility. However, one way to do it would be to force on all power
domains on boot if PM is not supported.

> Acked-by: Thierry Reding <treding@nvidia.com>

Thanks!
Jon

-- 
nvpublic
