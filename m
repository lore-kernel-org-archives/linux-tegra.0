From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v3 00/13] NVIDIA Tegra APB DMA driver fixes and improvements
Date: Wed, 8 Jan 2020 12:51:07 +0000
Message-ID: <85d8ea335734417081399a082d44024c@HQMAIL105.nvidia.com>
References: <20200106011708.7463-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200106011708.7463-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?utf-8?q?Micha=C5=82_Miros=C5=82?= aw <mirq-linux@rere.qmqm.pl>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, 06 Jan 2020 04:16:55 +0300, Dmitry Osipenko wrote:
> Hello,
>=20
> This is series fixes some problems that I spotted recently, secondly the
> driver's code gets a cleanup. Please review and apply, thanks in advance!
>=20
> Changelog:
>=20
> v3: - In the review comment to v1 Micha=C5=82 Miros=C5=82aw suggested tha=
t "Prevent
>       race conditions on channel's freeing" does changes that deserve to
>       be separated into two patches. I factored out and improved tasklet
>       releasing into this new patch:
>=20
>         dmaengine: tegra-apb: Clean up tasklet releasing
>=20
>     - The "Fix use-after-free" patch got an improved commit message.
>=20
> v2: - I took another look at the driver and spotted few more things that
>       could be improved, which resulted in these new patches:
>=20
>         dmaengine: tegra-apb: Remove runtime PM usage
>         dmaengine: tegra-apb: Clean up suspend-resume
>         dmaengine: tegra-apb: Add missing of_dma_controller_free
>         dmaengine: tegra-apb: Allow to compile as a loadable kernel modul=
e
>         dmaengine: tegra-apb: Remove MODULE_ALIAS
>=20
> Dmitry Osipenko (13):
>   dmaengine: tegra-apb: Fix use-after-free
>   dmaengine: tegra-apb: Implement synchronization callback
>   dmaengine: tegra-apb: Prevent race conditions on channel's freeing
>   dmaengine: tegra-apb: Clean up tasklet releasing
>   dmaengine: tegra-apb: Prevent race conditions of tasklet vs free list
>   dmaengine: tegra-apb: Use devm_platform_ioremap_resource
>   dmaengine: tegra-apb: Use devm_request_irq
>   dmaengine: tegra-apb: Fix coding style problems
>   dmaengine: tegra-apb: Remove runtime PM usage
>   dmaengine: tegra-apb: Clean up suspend-resume
>   dmaengine: tegra-apb: Add missing of_dma_controller_free
>   dmaengine: tegra-apb: Allow to compile as a loadable kernel module
>   dmaengine: tegra-apb: Remove MODULE_ALIAS
>=20
>  drivers/dma/Kconfig           |   2 +-
>  drivers/dma/tegra20-apb-dma.c | 481 ++++++++++++++++------------------
>  2 files changed, 220 insertions(+), 263 deletions(-)

Test results:
  13 builds: 13 pass, 0 fail
  12 boots:  11 pass, 1 fail
  38 tests:  38 pass, 0 fail

Linux version: 5.5.0-rc5-gf9d40c056c0f
Boards tested: tegra20-ventana, tegra30-cardhu-a04, tegra124-jetson-tk1,
               tegra186-p2771-0000, tegra194-p2972-0000,
               tegra210-p2371-2180
