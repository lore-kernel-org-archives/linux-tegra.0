From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/3] gpio: tegra: Don't open code
 of_device_get_match_data()
Date: Mon, 18 Apr 2016 10:29:07 -0600
Message-ID: <57150B53.2010209@wwwdotorg.org>
References: <1460969178-20914-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1460969178-20914-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, linus.walleij@linaro.org
Cc: gnurou@gmail.com, thierry.reding@gmail.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04/18/2016 02:46 AM, Laxman Dewangan wrote:
> Use of_device_get_match_data() for getting matched data
> instead of implementing this locally.

This patch,
Reviewed-by: Stephen Warren <swarren@nvidia.com>

