From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Please update linux-next url for tegra
Date: Mon, 10 Oct 2011 11:09:19 -0700
Message-ID: <CAOesGMjT+vyC8Jsjshrcz2f2xC=VEw+dTQh-rqLpjJMH5OJnag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

I'm taking over running the main tegra repo for a while, so please
change the old android.git.kernel.org-hosted branch to instead pull:

git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git for-next

And please pull it after the arm-soc tree.

I don't expect to have much long-lived contents in here -- they should
find their way into arm-soc quickly. But I also want to get patches
into linux-next as soon as possible without sending arm-soc pull
requests every few days.


-Olof
