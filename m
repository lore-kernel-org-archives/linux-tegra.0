From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v2 0/4] Tegra Video Decoder driver power management
 corrections
Date: Fri, 26 Jun 2020 08:58:17 +0200
Message-ID: <e41ff660-6c6c-d603-c767-34e7f4b4a23d@xs4all.nl>
References: <20200624150847.22672-1-digetx@gmail.com>
 <90323aa6-38b5-0a45-69a7-ccf380690a78@xs4all.nl>
 <23cbaa18-9461-8f72-3d43-aa14cd0c1095@gmail.com>
 <0e14df05-8299-52d6-df8f-0dd476f4109d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0e14df05-8299-52d6-df8f-0dd476f4109d@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 26/06/2020 02:17, Dmitry Osipenko wrote:
> 24.06.2020 18:23, Dmitry Osipenko пишет:
>> 24.06.2020 18:16, Hans Verkuil пишет:
>>> On 24/06/2020 17:08, Dmitry Osipenko wrote:
>>>> Hello,
>>>>
>>>> This small series addresses a Runtime PM issue that was discovered during
>>>> of Tegra VI driver reviewing by balancing RPM usage count on RPM resume
>>>> failure. Secondly it fixes reboot on some Tegra devices due to bootloader
>>>> expecting VDE power partition to be ON at the boot time, which wasn't
>>>> happening in case of a warm re-booting (i.e. by PMC resetting).
>>>
>>> Can you rebase this on top of the media_tree master branch? I think a variant
>>> of patch 1 has already been applied. I found a mail today where you mentioned
>>> that you preferred your version (it looks like I missed that) so you'll need to
>>> rework patch 1.
>>
>> Hello Hans,
>>
>> I'll take a look at what patches has been applied, my bad for sending
>> the v2 too late. Thank you for the heads up!
>>
> 
> I tested the already-applied variant of the patch 1 and it has the same
> behaviour as my variant, so it's okay.
> 
> Would you want me to send a v3 without the conflicting patch 1 or you
> could apply the patches 2-4 from this series?
> 

I'll mark 1/4 as superseded and will apply patches 2-4. No need for you
to do anything.

Regards,

	Hans
