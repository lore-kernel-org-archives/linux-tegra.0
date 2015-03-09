From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 3/4] pinctrl: tegra: support nvidia,io-hv DT property
Date: Mon, 09 Mar 2015 09:58:50 -0600
Message-ID: <54FDC33A.8040301@wwwdotorg.org>
References: <1424811651-18660-1-git-send-email-swarren@wwwdotorg.org>	<1424811651-18660-3-git-send-email-swarren@wwwdotorg.org> <CACRpkdYtUZOjEZYdOJt2NjtDBuo=Brp0babpRZVYdhic+US0Pg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYtUZOjEZYdOJt2NjtDBuo=Brp0babpRZVYdhic+US0Pg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 03/07/2015 01:10 PM, Linus Walleij wrote:
> On Tue, Feb 24, 2015 at 10:00 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
>
>> From: Stephen Warren <swarren@nvidia.com>
>>
>> Both nvidia,io-hv and nvidia,rcv-sel represent the fact that a particular
>> pin's IO buffers are configured to accept "high voltage" input signals.
>> The TRM for different chips names the register field rcv-sel on older
>> SoCs and io_hv on newer SoCs. Add the new naming option into the pinctrl
>> driver so that DT files can use naming consistent with the TRM.
>>
>> This new property name will be documented in the patch that adds support
>> for the new SoC.
>>
>> Signed-off-by: Stephen Warren <swarren@nvidia.com>
>
> Patch applied.

Thanks!

For the record in the list archives, I see patch 4 in your git repo too, 
although I didn't get a "patch applied" email for that one.
