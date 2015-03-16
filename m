From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2] pinctrl: tegra: use signed bitfields for optional
 fields
Date: Mon, 16 Mar 2015 16:28:17 -0600
Message-ID: <55075901.1010100@wwwdotorg.org>
References: <1426542154-31072-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1426542154-31072-1-git-send-email-stefan@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>, linus.walleij@linaro.org
Cc: thierry.reding@gmail.com, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Walmsley <pwalmsley@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 03/16/2015 03:42 PM, Stefan Agner wrote:
> Optional fields are set to -1 by various preprocessor macros. Make
> sure the fields can actually store them.

This seems fine to me. I suppose there is a small risk that the old code 
let some invalid configurations pass whereas this new code will reject 
them and hence not program any later pinmux configurations in the "list" 
in DT. However, I suspect the risk is quite small and won't be an issue.

Acked-by: Stephen Warren <swarren@nvidia.com>

I also tested this on Beaver, Dalmore, and Jetson TK1 using Paul 
Walmsley's automated test system, and saw no issues, so:

Tested-by: Stephen Warren <swarren@nvidia.com>
