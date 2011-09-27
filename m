From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2 2/3] arm/tegra: add support for ventana pinmuxing
Date: Tue, 27 Sep 2011 10:36:24 -0700
Message-ID: <CAOesGMjqhGYUQ2XmuBBTBSUA6mKnOLF=Hmi86hRQhLiUMPtiBg@mail.gmail.com>
References: <1317143421-27286-1-git-send-email-pdeschrijver@nvidia.com>
	<1317143421-27286-3-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1317143421-27286-3-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

The series looks reasonable to me, I'll apply it together with some of
the other pending tegra patches from the list. Once Stephen's pinmux
devicetree code is in place some of this can be removed.

One comment on this patch description though:


On Tue, Sep 27, 2011 at 10:10 AM, Peter De Schrijver
<pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Add support for ventana pinmuxing as a seaboard derivative. This is a cut down
> version of chromeos kernel commit 772f1b56e713be7a55759c2d5eadb9eb11d078db
> by Jong Kim <jongk-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.

Having a reference to a SHA1 in a foreign source tree isn't really
useful in the mainline kernel commit log.

I would just phrase it "This is a cut down version of work done by <....>"


-Olof
