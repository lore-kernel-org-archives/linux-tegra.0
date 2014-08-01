From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH 8/8] clk: tegra: Add EMC clock driver
Date: Fri, 1 Aug 2014 09:31:04 +0300
Message-ID: <53DB3428.1060400@nvidia.com>
References: <1405088313-20048-1-git-send-email-mperttunen@nvidia.com> <1405088313-20048-9-git-send-email-mperttunen@nvidia.com> <53CE97F2.80300@wwwdotorg.org> <53D75FA7.1030300@nvidia.com> <20140729201939.4627.79710@quantum> <53D81CD4.5010307@wwwdotorg.org> <20140730093456.GA29590@ulmo> <20140731190659.4463.92139@quantum> <53DA9ED2.5000003@wwwdotorg.org> <20140731230804.4463.12253@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140731230804.4463.12253@quantum>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 01/08/14 02:08, Mike Turquette wrote:
> ...
> That is sensible, and all the more reason that this patch shouldn't
> implement the rate-change feature within the clock driver. So consider
> it NAK'd.
>
> Also I agree that the per-clock debugfs entries are very useful for RO
> operations, especially exposing how registers are programmed or other
> relevant data.
>
> Regards,
> Mike
>

Sure, I'll remove the debugfs code from the next version.

Thanks, Mikko
