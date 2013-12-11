From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] pinctrl: tegra: Various Tegra124 fixes
Date: Wed, 11 Dec 2013 13:36:59 +0100
Message-ID: <CACRpkda2DtP-0eZqdzr4u443bgAjeCrwrc+=w6=d_NwQmREBkQ@mail.gmail.com>
References: <52A10C7B.8070406@wwwdotorg.org>
	<1386330839-30559-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386330839-30559-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Dec 6, 2013 at 12:53 PM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Remove various gratuitous blank lines and other minor whitespace and
> style cleanups. Add some missing commas within group arrays to prevent
> the compiler from concatenating the strings. Remove unneeded
> TEGRA_MUX_SAFE entry from enumeration and drop gratuitous _dt suffix
> from tegra_mux enumeration type name. Drop an unwarranted FIXME comment
> and rename gmi_ad8_ph0 pin to ph0 since that's how it's referenced in
> the DS06472001 datasheet.
>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Holding this patch off expecting it to be squashed into the driver
submission as stated in follow-up mails.

Yours,
Linus Walleij
