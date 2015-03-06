From: Kyle McMartin <kyle-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH v2 1/1] firmware: tegra: Add XHCI firmware v45.46 for T124
Date: Fri, 6 Mar 2015 11:58:10 -0500
Message-ID: <20150306165810.GT30928@merlin.infradead.org>
References: <1425498218-28733-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425498218-28733-1-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-firmware-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, abrestic-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, ajayg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, kyarlagadda-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Mar 04, 2015 at 11:43:38AM -0800, Andrew Chew wrote:
> Add firmware file for the T124 XHCI controller, along with the NVIDIA
> license file.
> 
> Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Merged, thanks... These licenses make me iffy, but reading the "open
source exception" carefully makes me think this will be fine (especially
if your legal department approved it...) 

regards, Kyle

> ---
>  LICENCE.nvidia           | 131 +++++++++++++++++++++++++++++++++++++++++++++++
>  WHENCE                   |   8 +++
>  nvidia/tegra124/xusb.bin | Bin 0 -> 134656 bytes
>  3 files changed, 139 insertions(+)
>  create mode 100644 LICENCE.nvidia
>  create mode 100644 nvidia/tegra124/xusb.bin
> 
