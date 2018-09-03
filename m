From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH 00/14] staging: media: tegra-vdea: Add Tegra124 support
Date: Mon, 3 Sep 2018 14:18:15 +0200
Message-ID: <ddf04f92-f82f-75bf-90a0-102437e3787f@xs4all.nl>
References: <20180813145027.16346-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20180813145027.16346-1-thierry.reding@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Thierry Reding <thierry.reding@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Thierry, Dmitry,

Dmitry found some issues, so I'll wait for a v2.

Anyway, this driver is in staging with this TODO:

- Implement V4L2 API once it gains support for stateless decoders.

I just wanted to mention that the Request API is expected to be merged
for 4.20. A topic branch is here:

https://git.linuxtv.org/media_tree.git/log/?h=request_api

This patch series is expected to be added to the topic branch once
everyone agrees:

https://www.spinics.net/lists/linux-media/msg139713.html

The first Allwinner driver that will be using this API is here:

https://lwn.net/Articles/763589/

It's expected to be merged for 4.20 as well.

Preliminary H264 work for the Allwinner driver is here:

https://lkml.org/lkml/2018/6/13/399

But this needs more work.

HEVC support, on the other hand, is almost ready:

https://lkml.org/lkml/2018/8/28/229

I hope these links give a good overview of the current status.

Regards,

	Hans

On 08/13/2018 04:50 PM, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Hi,
> 
> this set of patches perform a bit of cleanup and extend support to the
> VDE implementation found on Tegra114 and Tegra124. This requires adding
> handling for a clock and a reset for the BSEV block that is separate
> from the main VDE block. The new VDE revision also supports reference
> picture marking, which requires that the BSEV writes out some related
> data to a memory location. Since the supported tiling layouts have been
> changed in Tegra124, which supports only block-linear and no pitch-
> linear layouts, a new way is added to request a specific layout for the
> decoded frames. Both of the above changes require breaking the ABI to
> accomodate for the new data in the custom IOCTL.
> 
> Finally this set also adds support for dealing with an IOMMU, which
> makes it more convenient to deal with imported buffers since they no
> longer need to be physically contiguous.
> 
> Userspace changes for the updated ABI are available here:
> 
> 	https://cgit.freedesktop.org/~tagr/libvdpau-tegra/commit/
> 
> Mauro, I'm sending the device tree changes as part of the series for
> completeness, but I expect to pick those up into the Tegra tree once
> this has been reviewed and you've applied the driver changes.
> 
> Thanks,
> Thierry
> 
> Thierry Reding (14):
>   staging: media: tegra-vde: Support BSEV clock and reset
>   staging: media: tegra-vde: Support reference picture marking
>   staging: media: tegra-vde: Prepare for interlacing support
>   staging: media: tegra-vde: Use DRM/KMS framebuffer modifiers
>   staging: media: tegra-vde: Properly mark invalid entries
>   staging: media: tegra-vde: Print out invalid FD
>   staging: media: tegra-vde: Add some clarifying comments
>   staging: media: tegra-vde: Track struct device *
>   staging: media: tegra-vde: Add IOMMU support
>   staging: media: tegra-vde: Keep VDE in reset when unused
>   ARM: tegra: Enable VDE on Tegra124
>   ARM: tegra: Add BSEV clock and reset for VDE on Tegra20
>   ARM: tegra: Add BSEV clock and reset for VDE on Tegra30
>   ARM: tegra: Enable SMMU for VDE on Tegra124
> 
>  arch/arm/boot/dts/tegra124.dtsi             |  42 ++
>  arch/arm/boot/dts/tegra20.dtsi              |  10 +-
>  arch/arm/boot/dts/tegra30.dtsi              |  10 +-
>  drivers/staging/media/tegra-vde/tegra-vde.c | 528 +++++++++++++++++---
>  drivers/staging/media/tegra-vde/uapi.h      |   6 +-
>  5 files changed, 511 insertions(+), 85 deletions(-)
> 
