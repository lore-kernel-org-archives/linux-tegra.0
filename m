From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Resend] SHIELD (tegra114-roth) Serial Console UART
Date: Sat, 14 Feb 2015 12:40:53 +0900
Message-ID: <CAAVeFuKOjDzA_vJeqQFY0URGBxiYBGPvSvXwyxLNfLXw4Oe4LA@mail.gmail.com>
References: <ABAE5648-C477-451F-ACF6-6314C8B198DB@ziswiler.com> <61E1CB06-407A-4F7E-B5D9-BCFA8B2CCE99@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <61E1CB06-407A-4F7E-B5D9-BCFA8B2CCE99-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, Feb 14, 2015 at 7:04 AM, Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org> wrote:
>
>
> Hi there
>
> Does by any chance anybody know how one can get a serial console UART on SHIELD (tegra114-roth)? I know there is some kind of a debug connector inside [1] similar to e.g. the one found on Cardhu albeit not assembled of course but is that pinout standardized?

The pinout should be identical to Cardhu ; otherwise, as Mikko
suggested getting a serial out of the SD port after some pinmuxing
would achieve almost the same result with less tampering.

PS: nice to see people are actually using that SHIELD port! ;)
