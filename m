From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 4/7] mfd: cros_ec: spi: Increase cros_ec_spi deadline from
 5ms to 100ms
Date: Fri, 18 Apr 2014 11:30:55 -0600
Message-ID: <CAPnjgZ1_LAzUMX+K06o7A8uH6RLk59E-3mV30-Yo8YRcwvsJ8A@mail.gmail.com>
References: <1397757570-19750-1-git-send-email-dianders@chromium.org>
	<1397757570-19750-5-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1397757570-19750-5-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Lee Jones <lee.jones@linaro.org>, Stephen Warren <swarren@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>, Andrew Bresticker <abrestic@chromium.org>, Dylan Reid <dgreid@chromium.org>, Olof Johansson <olof@lixom.net>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, lk <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hi Doug,

On 17 April 2014 11:59, Doug Anderson <dianders@chromium.org> wrote:
> We're adding i2c tunneling to the list of things that goes over
> cros_ec.  i2c tunneling can be slooooooow, so increase our deadline to
> 100ms to account for that.
>
> Signed-off-by: Doug Anderson <dianders@chromium.org>

I believe the EC protocol should be changed on future platforms to
poll for completion of I2C, but in the meantime this patch prevents
failure.

Reviewed-by: Simon Glass <sjg@chromium.org>
