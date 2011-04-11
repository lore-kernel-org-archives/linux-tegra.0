From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [alsa-devel] Tegra ASoC, multiple boards, platform data, and
	conditionals in machine driver
Date: Mon, 11 Apr 2011 02:58:09 +0100
Message-ID: <20110411015809.GA23214@sirena.org.uk>
References: <74CDBE0F657A3D45AFBB94109FB122FF0493EB3A50@HQMAIL01.nvidia.com> <20110409023057.GA3792@opensource.wolfsonmicro.com> <74CDBE0F657A3D45AFBB94109FB122FF0493EB3B5B@HQMAIL01.nvidia.com> <BANLkTikQhe1+ufvZWFKU1DT+XCS9=xE0Xw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <BANLkTikQhe1+ufvZWFKU1DT+XCS9=xE0Xw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "Erik Gilling (konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org)" <konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "Colin Cross (ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org)" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sun, Apr 10, 2011 at 11:18:17AM -0700, Olof Johansson wrote:

> built. It also makes it harder to maintain a multiplatform kernel if
> configuration data is pulled in at build time instead of runtime (i.e.
> headers vs platform_data or similar).

Note that whatever option is chosen the configuration should be pulled
in at runtime, it's purely a question of where the data table goes - do
you pass the full thing through platform datra or do you just pass the
machine type.

>  In other words, I would prefer option (b) above.

Another thing to bear in mind is that it's only feasable to try to
combine the Tegra/WM8903 combinations - trying to combine machine
drivers for multiple unrelated CODECs isn't going to work well.
