From: Andrew Bresticker <abrestic-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/1] firmware: tegra: Add XHCI firmware v45.45 for T124
Date: Wed, 27 Aug 2014 19:24:11 -0700
Message-ID: <CAL1qeaHp7RcNxJEuyzQhn2=rSSqVUkSL+MxnqnCCfLmbK46ixg@mail.gmail.com>
References: <1409191899-12884-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409191899-12884-1-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-firmware-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Ajay Gupta <ajayg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, kyarlagadda-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Aug 27, 2014 at 7:11 PM, Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Add firmware file for the T124 XHCI controller, along with the NVIDIA
> license file.
>
> Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  LICENCE.nvidia           | 111 +++++++++++++++++++++++++++++++++++++++++++++++
>  tegra12x/xusb_sil_rel_fw | Bin 0 -> 134656 bytes
>  2 files changed, 111 insertions(+)
>  create mode 100644 LICENCE.nvidia
>  create mode 100644 tegra12x/xusb_sil_rel_fw

Can you instead place this at "nvidia/tegra124/xusb.bin"?  That's the
location we've decided on during review of the xhci-tegra driver.
(Sorry, it looks like I forgot to mention this to you earlier).
