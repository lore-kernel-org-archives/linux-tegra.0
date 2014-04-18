From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 3/7] mfd: cros_ec: spi: Make the cros_ec_spi timeout more reliable
Date: Fri, 18 Apr 2014 11:26:56 -0600
Message-ID: <CAPnjgZ2J8V=ZtivYZJOepBi_6h7VEhZ+R-XjjT+yA0YeW9+Tqw@mail.gmail.com>
References: <1397757570-19750-1-git-send-email-dianders@chromium.org>
	<1397757570-19750-4-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1397757570-19750-4-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Lee Jones <lee.jones@linaro.org>, Stephen Warren <swarren@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>, Andrew Bresticker <abrestic@chromium.org>, Dylan Reid <dgreid@chromium.org>, Olof Johansson <olof@lixom.net>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, lk <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 17 April 2014 11:59, Doug Anderson <dianders@chromium.org> wrote:
> The cros_ec_spi transfer had two problems with its timeout code:
>
> 1. It looked at the timeout even in the case that it found valid data.
> 2. If the cros_ec_spi code got switched out for a while, it's possible
>    it could get a timeout after a single loop.  Let's be paranoid and
>    make sure we do one last transfer after the timeout expires.
>
> Signed-off-by: Doug Anderson <dianders@chromium.org>

Reviewed-by: Simon Glass <sjg@chromium.org>
