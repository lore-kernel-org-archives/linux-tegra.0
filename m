From: Andre Heider <a.heider@gmail.com>
Subject: Re: [PATCH v4 0/4] MBIST work around (WAR) for Tegra210
Date: Tue, 13 Feb 2018 06:54:48 +0100
Message-ID: <4de03c4d-c5c1-f3ea-1ddc-cd5990aadb47@gmail.com>
References: <1516888813-32180-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1516888813-32180-1-git-send-email-pdeschrijver@nvidia.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: jonathanh@nvidia.com, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 25, 2018 at 04:00:09PM +0200, Peter De Schrijver wrote:
 > This patch series introduces the Memory Built-In Self Test (MBIST)
 > work around (WAR) needed when power ungating certain domains. More
 > details can be found in 'clk: tegra: MBIST WAR for Tegra210'. I choose to
 > implement the WAR in the Tegra210 clock driver, because most accesses are
 > to CAR registers and for the VENC domain, we need to make sure the CSI
 > clock source is not changed during the WAR execution.

For the series:
Tested-by: Andre Heider <a.heider@gmail.com>

With one patch on top [0] this finally fixes the 'green bars' issue, see 
[1].

Thanks!
Andre

[0] 
https://github.com/thierryreding/linux/commit/13eea63a70de753466fc644f55a134a13b9b584b
[1] https://github.com/denysvitali/linux-on-pixel-c/issues/1
