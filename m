From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/2] video: tegra: Add dc color dithering support
Date: Sat, 16 Apr 2011 23:15:47 -0700
Message-ID: <BANLkTi=dSG0hQF7n0G6CihOW1hAFETNTKg@mail.gmail.com>
References: <1302923939-374-1-git-send-email-rmorell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1302923939-374-1-git-send-email-rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 15, 2011 at 8:18 PM, Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wro=
te:
> This change adds support for display color dithering configuration in
> the display control structure. =A0Two dithering modes are possible:
> ordered and error-diffusion mode. =A0Error-diffusion dithering is usu=
ally
> considered higher quality, but can only be used when the active regio=
n
> is less than 640 pixels wide.
>
> This is based on patches from Chao Jiang <chaoj-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Signed-off-by: Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>


-Olof
