From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv2 0/7] Miscellaneous fixes to host1x
Date: Fri, 31 May 2013 10:03:15 +0300
Message-ID: <51A84B33.70109@nvidia.com>
References: <1369823168-5396-1-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1369823168-5396-1-git-send-email-amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 29.05.2013 13:26, Arto Merilainen wrote:
> This patch series fixes two issues in the host1x driver: First, the
> command buffer validation routine had vulnerabilities that were not
> detected in earlier testing. Second, the return codes of some
> functions were misleading or completely missing. This caused the
> driver to give wrong return codes also to the userspace.
> 
> The series is based on top of 3.10rc3. I have tested the patch series
> on cardhu by running host1x and gr2d test cases (available at [0]).
> I would appreciate any help in testing/reviewing these patches.
> 
> Changes from v1:
>  * Rebased on top of 3.10rc3
>  * Split firewall fixes to smaller patches
>  * Reworked no-reloc case in firewall code. Fix in v1 was not
>    sufficient in all cases
>  * Dropped patch "Fix syncpoint wait return value" as it is not
>    critical and discussion on it has not yet settled.
>  * Fixed style and whitespace issues
> 
> [0] https://gitorious.org/linux-host1x/libdrm-host1x
> 
> Arto Merilainen (5):
>   gpu: host1x: Check reloc table before usage
>   gpu: host1x: Copy gathers before verification
>   gpu: host1x: Fix memory access in syncpt request
>   gpu: host1x: Fix client_managed type
>   gpu: host1x: Rework CPU syncpoint increment
> 
> Terje Bergstrom (2):
>   gpu: host1x: Check INCR opcode correctly
>   gpu: host1x: Don't reset firewall between gathers
> 
>  drivers/gpu/host1x/dev.h          |   8 +--
>  drivers/gpu/host1x/drm/drm.c      |   3 +-
>  drivers/gpu/host1x/drm/gr2d.c     |   2 +-
>  drivers/gpu/host1x/hw/cdma_hw.c   |   2 +-
>  drivers/gpu/host1x/hw/syncpt_hw.c |  12 ++--
>  drivers/gpu/host1x/job.c          | 135 +++++++++++++++++---------------------
>  drivers/gpu/host1x/syncpt.c       |  26 +++-----
>  drivers/gpu/host1x/syncpt.h       |  13 ++--
>  8 files changed, 85 insertions(+), 116 deletions(-)
> 

Arto's patches above,

Acked-By: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Terje
