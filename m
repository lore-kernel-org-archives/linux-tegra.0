From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [RFC 10/42] drivers/input/keyboard: don't check resource with devm_ioremap_resource
Date: Sun, 12 May 2013 20:42:45 +0530
Message-ID: <CAOh2x=nTCRb_uH5XA=N4JJwbZYSiXNZbi3cQeXDP4RxXuEFTGw@mail.gmail.com>
References: <1368173847-5661-1-git-send-email-wsa@the-dreams.de>
	<1368173847-5661-11-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <1368173847-5661-11-git-send-email-wsa@the-dreams.de>
Sender: linux-input-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-input@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, May 10, 2013 at 1:46 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
> devm_ioremap_resource does sanity checks on the given resource. No need to
> duplicate this in the driver.
>
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
> ---
>  drivers/input/keyboard/spear-keyboard.c

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
