From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/3] gpio: tegra: Remove the need of keeping device handle
 for gpio driver
Date: Mon, 18 Apr 2016 10:29:53 -0600
Message-ID: <57150B81.6040104@wwwdotorg.org>
References: <1460969178-20914-1-git-send-email-ldewangan@nvidia.com>
 <1460969178-20914-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1460969178-20914-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, linus.walleij@linaro.org
Cc: gnurou@gmail.com, thierry.reding@gmail.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04/18/2016 02:46 AM, Laxman Dewangan wrote:
> Remove the file static device handle variable as this is just
> required for prints. The required handle can be stored in
> tegra_gpio_chip and hence it become redundancy.

This seems fine as far as it goes, but if it's worth doing this, please 
move all the globals into the GPIO chip rather than just one of the 7 
globals.
