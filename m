From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: tegra: Rename some bindings for
 consistency
Date: Mon, 11 Apr 2016 09:58:14 -0600
Message-ID: <570BC996.3050804@wwwdotorg.org>
References: <1460383086-26957-1-git-send-email-thierry.reding@gmail.com>
 <1460383086-26957-2-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460383086-26957-2-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/11/2016 07:58 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Device tree binding for NVIDIA Tegra have traditionally carried the
> "nvidia," vendor prefix in the filename. A couple of odd ones don't, so
> fix them up for consistency.
>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   .../devicetree/bindings/ata/nvidia,tegra-ahci.txt  |  32 ++
>   .../devicetree/bindings/ata/tegra-sata.txt         |  32 --
>   .../bindings/dma/nvidia,tegra20-apbdma.txt         |  44 +++
>   .../devicetree/bindings/dma/tegra20-apbdma.txt     |  44 ---
>   .../memory-controllers/nvidia,tegra-emc.txt        | 374 +++++++++++++++++++++
>   .../bindings/memory-controllers/tegra-emc.txt      | 374 ---------------------
>   .../bindings/thermal/nvidia,tegra-soctherm.txt     |  67 ++++
>   .../devicetree/bindings/thermal/tegra-soctherm.txt |  67 ----
>   8 files changed, 517 insertions(+), 517 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/ata/nvidia,tegra-ahci.txt

The filenames should exactly match the (first) compatible value they 
document for consistency with other bindings. That should be 
nvidia,tegra124-ahci.txt.

>   delete mode 100644 Documentation/devicetree/bindings/ata/tegra-sata.txt
>   create mode 100644 Documentation/devicetree/bindings/dma/nvidia,tegra20-apbdma.txt
>   delete mode 100644 Documentation/devicetree/bindings/dma/tegra20-apbdma.txt
>   create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra-emc.txt

That should be nvidia,tegra124-emc.txt.

>   delete mode 100644 Documentation/devicetree/bindings/memory-controllers/tegra-emc.txt
>   create mode 100644 Documentation/devicetree/bindings/thermal/nvidia,tegra-soctherm.txt
>   delete mode 100644 Documentation/devicetree/bindings/thermal/tegra-soctherm.txt

That should be nvidia,tegra124-soctherm.txt.

I assume the delete/create content is identical, although I didn't both 
to check.

With the fixes above,
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
