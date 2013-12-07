From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: tegra: add missing error handling to probe
Date: Sat, 7 Dec 2013 14:47:33 +0900
Message-ID: <CAAVeFu+bK1A39Y24jd2i-8G=YRNCuyjDOQEmm+3Y1_3P5iREAw@mail.gmail.com>
References: <1386362171-29311-1-git-send-email-swarren@wwwdotorg.org> <20131206210828.GB1685@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20131206210828.GB1685@mithrandir>
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Sat, Dec 7, 2013 at 6:08 AM, Thierry Reding <thierry.reding@gmail.com> wrote:
> On Fri, Dec 06, 2013 at 01:36:11PM -0700, Stephen Warren wrote:
>> From: Stephen Warren <swarren@nvidia.com>
>>
>> The call to gpiochip_add() is not currently error-checked. Add the
>> missing checking.
>>
>> Signed-off-by: Stephen Warren <swarren@nvidia.com>
>> ---
>> Perhaps this should be Cc: stable since Greg wants more stable patches,
>> but it's not a bug that's likely to be hit...
>> ---
>>  drivers/gpio/gpio-tegra.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> Reviewed-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
