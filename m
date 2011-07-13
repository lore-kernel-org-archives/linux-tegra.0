From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: Tegra: Seaboard board updates for audio
Date: Wed, 13 Jul 2011 16:17:06 -0700
Message-ID: <CAOesGMjiakgvs8wcu8zRkuA9mxD5Z=S-hV3HNgqFC49pEGVADw@mail.gmail.com>
References: <1310594272-8229-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1310594272-8229-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 13, 2011 at 2:57 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> * Initialize clock tree for audio
> * Add GPIO base definitions
> * Add audio GPIO definitions
> * Define platform data for WM8903 and ASoC machine driver
> * Add special case for Kaen to handle HP_MUTE GPIO
> * Register platform devices for audio
> * Update pinmux to cater for new GPIOs used for audio
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Colin, sounds like you're collecting board patches this merge window, so:

Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>


-Olof
