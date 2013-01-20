From: Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH 0/3] pwm-backlight: add subdrivers & Tegra support
Date: Sun, 20 Jan 2013 14:26:07 +0900
Message-ID: <CAAVeFuKkw3b-Jw1s7tc8YUyH6sg8ipqBFFxs4tUBrj9_BDsBMA@mail.gmail.com>
References: <1358591420-7790-1-git-send-email-acourbot@nvidia.com> <50FB669C.3020704@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50FB669C.3020704@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Zhang <markz@nvidia.com>
Cc: Thierry Reding <thierry.reding@avionic-design.de>, Stephen Warren <swarren@wwwdotorg.org>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-tegra@vger.kernel.org

On Sun, Jan 20, 2013 at 12:38 PM, Mark Zhang <markz@nvidia.com> wrote:
> So this is a non power sequence version of backlight & panel enabling,
> isn't it? I remember we talked about this several days ago and you
> mentioned kernel guys want an ad-hoc version(power sequence logics
> inside driver, not in DT) and I believe this is it, right?

Basically, yes - I still think power-seqs could be useful here
(especially after seeing the size of these sub-drivers if you want to
do error checking properly) and plan to give it another shot without
DT, but this will not happen soon since we need to do some GPIO
redesign before. You can see what's wrong in the init() function of
the subdriver: we call a device tree function to obtain the GPIO as
there is no get function.

> I think finally I can enable Tegra30 cardhu's display after this patch
> merged.

Yes, feel free to write a subdriver for Cardhu if you like - I'd like
to see all T20 and T30 boards supported by the time this gets merged.

Thanks,
Alex.
