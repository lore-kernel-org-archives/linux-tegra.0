From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3] drm/tegra: sor: Enable HDA interrupts at plug-in
Date: Wed, 24 Jul 2019 14:29:30 +0300
Message-ID: <341b9177-180c-8fc1-f9cc-27f3b48a8b9c@gmail.com>
References: <1563885610-27198-1-git-send-email-viswanathl@nvidia.com>
 <0ba35efb-44ec-d56c-b559-59f1daa3e6e4@gmail.com>
 <8b113ad7-07b4-7dfb-e2e5-653514686085@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8b113ad7-07b4-7dfb-e2e5-653514686085@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Viswanath L <viswanathl@nvidia.com>, thierry.reding@gmail.com
Cc: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

24.07.2019 14:11, Jon Hunter пишет:
> 
> On 24/07/2019 10:27, Dmitry Osipenko wrote:
>> 23.07.2019 15:40, Viswanath L пишет:
>>> HDMI plugout calls runtime suspend, which clears interrupt registers
>>> and causes audio functionality to break on subsequent plug-in; setting
>>> interrupt registers in sor_audio_prepare() solves the issue.
>>>
>>> Signed-off-by: Viswanath L <viswanathl@nvidia.com>
>>
>> Yours signed-off-by always should be the last line of the commit's
>> message because the text below it belongs to a person who applies this
>> patch, Thierry in this case. This is not a big deal at all and Thierry
>> could make a fixup while applying the patch if will deem that as necessary.
>>
>> Secondly, there is no need to add "stable@vger.kernel.org" to the
>> email's recipients because the patch will flow into stable kernel
>> versions from the mainline once it will get applied. That happens based
>> on the stable tag presence, hence it's enough to add the 'Cc' tag to the
>> commit's message in order to get patch backported.
> 
> I believe 'git send-email' automatically does this.

Indeed, completely forgot that I have '--suppress-cc=all' in my git's setup.
