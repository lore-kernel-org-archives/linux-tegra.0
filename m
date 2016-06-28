From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v5] clk: tegra: Initialize UTMIPLL when enabling PLLU
Date: Tue, 28 Jun 2016 17:30:16 +0100
Message-ID: <5772A618.4020207@nvidia.com>
References: <1464280891-23036-1-git-send-email-rklein@nvidia.com>
 <5763FFF5.5000303@nvidia.com> <20160617152336.GA27475@ulmo.ba.sec>
 <dc524c6236144234a341fedaa22dbacb@HQMAIL112.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <dc524c6236144234a341fedaa22dbacb@HQMAIL112.nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Bresticker <abrestic@chromium.org>
List-Id: linux-tegra@vger.kernel.org

Hi Rhyland,

On 27/06/16 19:11, Rhyland Klein wrote:
> Jonathan, can you confirm replacing usleep_range(100, 200) with udelay(2) works for you?

Yes for me, using a udelay(2) does seem to work. I have made sure that a
usb device is still detected on the Jetson TX1. However, I am not sure
the best way to test this thoroughly.

If we do make this change it would be good to propagate downstream as
well to get wider testing.

Cheers
Jon

-- 
nvpublic
