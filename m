From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 5/6] gpu: drm: tegra: Prime support
Date: Mon, 26 Nov 2012 08:33:39 +0100
Message-ID: <7DC9167CA73B39468DFA1D07FF67A6A85150E61DDB@DEMAIL01.nvidia.com>
References: <1353577684-7896-1-git-send-email-tbergstrom@nvidia.com>
 <1353577684-7896-6-git-send-email-tbergstrom@nvidia.com>
 <20121123215528.GB21555@avionic-0098.adnet.avionic-design.de>
 <50B0733D.4040002@nvidia.com>
 <20121124191445.GE26154@avionic-0098.adnet.avionic-design.de>,<50B12724.7020503@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50B12724.7020503-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The code can be revived if necessary. I still think this code should be kept tegra specific because the current implementation IMO does not work in generic case... and the generic case solution would not suit well for our needs.

Our implementation assumes that both source and target devices share the same address space and thus there is no need to actually do buffer mapping when the target device wishes to access a buffer. The code just creates a scattertable for already mapped pages. Currently we wish to share buffers only between host1x devices and therefore this restriction does not cause any issues. However, in generic case the target and source devices can be in different address spaces and hence the code actually _should_ map the buffer to the target device's address space.

AFAIK dma-mapping API is not smart enough to determine whether a given buffer is already mapped to some address space. It just maps and potentially creates duplicates (please correct me if I am wrong). Therefore, if the "generic case solution" is applied to our "specific case", there will always be duplicates and I do not think that is a good practice. I also considered doing a smart optimisation here, but dma-mapping API did not seem to support querying of the address space of a certain device.

- Arto
________________________________________
From: Terje Bergstrom
Sent: Saturday, November 24, 2012 9:59 PM
To: Thierry Reding
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Arto Merilainen
Subject: Re: [PATCH 5/6] gpu: drm: tegra: Prime support

On 24.11.2012 21:14, Thierry Reding wrote:
> I still don't see how that's relevant here. IOMMU support has explicitly
> been removed as you mentioned in your introductory email and none of the
> functionality in this patch is in any way specific to Tegra. Right?

You're right - my point became moot once we disabled IOMMU. Arto, can we
revive the generic code?

Terje
