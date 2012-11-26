From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 4/6] gpu: drm: tegra: Free platform data on remove
Date: Mon, 26 Nov 2012 08:33:55 +0100
Message-ID: <7DC9167CA73B39468DFA1D07FF67A6A85150E61DDC@DEMAIL01.nvidia.com>
References: <1353577684-7896-1-git-send-email-tbergstrom@nvidia.com>
 <1353577684-7896-5-git-send-email-tbergstrom@nvidia.com>,<20121123215305.GA21555@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121123215305.GA21555-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thank you for your comments, I will drop this patch.

- Arto
________________________________________
From: Thierry Reding [thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org]
Sent: Friday, November 23, 2012 11:53 PM
To: Terje Bergstrom
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Arto Merilainen
Subject: Re: [PATCH 4/6] gpu: drm: tegra: Free platform data on remove

* PGP Signed by an unknown key

On Thu, Nov 22, 2012 at 11:48:02AM +0200, Terje Bergstrom wrote:
> From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Platform data was not freed in device removal. This patch adds
> missing devm_kfree() calls.
>
> Change-Id: Id00fd1940e786dbc80c7ac5a1bd4d6a4c18720a1
> Signed-off-by: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/dc.c   |    3 +++
>  drivers/gpu/drm/tegra/dsi.c  |    3 +++
>  drivers/gpu/drm/tegra/hdmi.c |    3 +++
>  drivers/gpu/drm/tegra/tvo.c  |    3 +++
>  4 files changed, 12 insertions(+)

All of this is unnecessary. The reason for using the managed allocations
in the first place is because the memory is automatically freed when the
device is removed.

Thierry

* Unknown Key
* 0x7F3EB3A1
