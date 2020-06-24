From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/4] Tegra Video Decoder driver power management
 corrections
Date: Wed, 24 Jun 2020 18:23:59 +0300
Message-ID: <23cbaa18-9461-8f72-3d43-aa14cd0c1095@gmail.com>
References: <20200624150847.22672-1-digetx@gmail.com>
 <90323aa6-38b5-0a45-69a7-ccf380690a78@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <90323aa6-38b5-0a45-69a7-ccf380690a78-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

24.06.2020 18:16, Hans Verkuil пишет:
> On 24/06/2020 17:08, Dmitry Osipenko wrote:
>> Hello,
>>
>> This small series addresses a Runtime PM issue that was discovered during
>> of Tegra VI driver reviewing by balancing RPM usage count on RPM resume
>> failure. Secondly it fixes reboot on some Tegra devices due to bootloader
>> expecting VDE power partition to be ON at the boot time, which wasn't
>> happening in case of a warm re-booting (i.e. by PMC resetting).
> 
> Can you rebase this on top of the media_tree master branch? I think a variant
> of patch 1 has already been applied. I found a mail today where you mentioned
> that you preferred your version (it looks like I missed that) so you'll need to
> rework patch 1.

Hello Hans,

I'll take a look at what patches has been applied, my bad for sending
the v2 too late. Thank you for the heads up!
