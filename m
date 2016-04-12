From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: tegra: Rename some bindings for
 consistency
Date: Mon, 11 Apr 2016 20:26:30 -0600
Message-ID: <570C5CD6.2090700@wwwdotorg.org>
References: <1460383086-26957-1-git-send-email-thierry.reding@gmail.com>
 <1460383086-26957-2-git-send-email-thierry.reding@gmail.com>
 <570C4F2F.8050407@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <570C4F2F.8050407-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/11/2016 07:28 PM, Joseph Lo wrote:
> On 04/11/2016 09:58 PM, Thierry Reding wrote:
>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Device tree binding for NVIDIA Tegra have traditionally carried the
>> "nvidia," vendor prefix in the filename. A couple of odd ones don't, so
>> fix them up for consistency.
>>
>> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   .../devicetree/bindings/ata/nvidia,tegra-ahci.txt  |  32 ++
>>   .../devicetree/bindings/ata/tegra-sata.txt         |  32 --
>>   .../bindings/dma/nvidia,tegra20-apbdma.txt         |  44 +++
>>   .../devicetree/bindings/dma/tegra20-apbdma.txt     |  44 ---
>>   .../memory-controllers/nvidia,tegra-emc.txt        | 374
>> +++++++++++++++++++++
>>   .../bindings/memory-controllers/tegra-emc.txt      | 374
>> ---------------------
>>   .../bindings/thermal/nvidia,tegra-soctherm.txt     |  67 ++++
>>   .../devicetree/bindings/thermal/tegra-soctherm.txt |  67 ----
>>   8 files changed, 517 insertions(+), 517 deletions(-)
>>   create mode 100644
>> Documentation/devicetree/bindings/ata/nvidia,tegra-ahci.txt
>>   delete mode 100644 Documentation/devicetree/bindings/ata/tegra-sata.txt
>>   create mode 100644
>> Documentation/devicetree/bindings/dma/nvidia,tegra20-apbdma.txt
>>   delete mode 100644
>> Documentation/devicetree/bindings/dma/tegra20-apbdma.txt
>>   create mode 100644
>> Documentation/devicetree/bindings/memory-controllers/nvidia,tegra-emc.txt
>>   delete mode 100644
>> Documentation/devicetree/bindings/memory-controllers/tegra-emc.txt
>>   create mode 100644
>> Documentation/devicetree/bindings/thermal/nvidia,tegra-soctherm.txt
>>   delete mode 100644
>> Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
>>
>
> Hi,
>
> Could we use the "-M" and "-C" option to detect the difference if this
> is just rename or copy from the original file? That way we can still
> remain the connection of the history log that we can still check the
> file history by "git blame".
>
> If we do this by deleting and recreating the same file content with
> renamed filename, we will lose the history log.

When this is applied, git will actually realize it's a move not a 
delete/add and maintain the history just fine. It only looks like a 
delete/rename in the "git format-patch" output when -M/-C isn't used.
