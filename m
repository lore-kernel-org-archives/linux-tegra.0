From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V2] pinctrl: tegra: Correctly check the supported
 configuration
Date: Mon, 2 May 2016 11:47:49 -0600
Message-ID: <572792C5.1030403@wwwdotorg.org>
References: <1462209804-16582-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1462209804-16582-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, linus.walleij@linaro.org
Cc: thierry.reding@gmail.com, gnurou@gmail.com, rklein@nvidia.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 05/02/2016 11:23 AM, Laxman Dewangan wrote:
> The pincontrol registers of Tegra chips has multiple filed per
> registers. There is two type of registers mux and drive. All
> configurations belongs to one of these registers.
>
> If any configurations are supported then <config>_bit is set to
> bit position of these registers otherwise -1 to not support it.
> The member is defined as
> 	s32 <config>_bit:6;
>
> So if config is not supported ifor given SoC then it is set to -1
> in soc pinmmux table.
> In common driver code, to find out that given config is supported
> or not, it is checked as:
>
> s8 bit = <config>_bit;
> if (bit > 31) {
> 	/* Not supported config */
> }
>
> But in this case, bit is s8 and hence for non supporting it is -1.
>
> Correct the check as:
> if (bit < 0) {
> 	/* Not supported config */
> }
>
> Fixes: e4c02dced975cb ("pinctrl: tegra: use signed bitfields for optional fields")
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

Nit: There shouldn't be a blank line between the Fixes: and 
Signed-off-by: lines. I assume this can be fixed when the patch is applied.

Acked-by: Stephen Warren <swarren@nvidia.com>
