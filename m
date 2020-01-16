From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 0/8] NVIDIA Tegra I2C driver fixes and improvements
Date: Thu, 16 Jan 2020 19:38:16 +0300
Message-ID: <ea7c484b-d8ae-48b9-84ca-db26902f4654@gmail.com>
References: <20200114013442.28448-1-digetx@gmail.com>
 <20200115173535.GF1239@ninjato>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200115173535.GF1239@ninjato>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

15.01.2020 20:35, Wolfram Sang пишет:
> On Tue, Jan 14, 2020 at 04:34:34AM +0300, Dmitry Osipenko wrote:
>> Hello,
>>
>> This patchset adds support for atomic transfers which are required for
>> shutting down machine properly. Secondly, a (not)suspending I2C and some
>> other things are fixed/improved by this small series as well. Please review
>> and apply, thanks in advance!
>>
>> Changelog:
>>
>> v5: Improved commit message of the "Support atomic transfers" patch,
>>     thanks to Wolfram Sang.
>>
>>     Added explicit stable tags to these patches:
>>
>>       i2c: tegra: Fix suspending in active runtime PM state
>>       i2c: tegra: Properly disable runtime PM on driver's probe error
> 
> Patches 1+2 applied to for-current and patches 3-8 applied to for-next,
> thanks!
> 
> Checkpatch spit out some of those:
> 
> CHECK: Lines should not end with a '('
> 
> I didn't mind. We can fix it incrementally if you want to fix it.
> 

Thank you very much!

I was aware of those minor warnings, but couldn't instantly see how to
fix them without making code less readable.
