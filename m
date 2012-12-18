From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ftrace doesn't work - 1211 upstream kernel
Date: Tue, 18 Dec 2012 19:31:55 +0800
Message-ID: <50D0542B.9060407@gmail.com>
References: <50C86A0D.9060009@gmail.com> <50C877EE.60507@nvidia.com> <50C93A27.8080002@gmail.com> <87bodspaqu.fsf@amiettinen-lnx.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87bodspaqu.fsf-sS3DoGclAPwgdTl23f3CEMVPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antti P Miettinen <ananaza-X3B1VOXEql0@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/18/2012 06:36 AM, Antti P Miettinen wrote:
> Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>> Terje, did yo test the ToT(1211) kernel?
>>
>> Could you tell me which ftrace configs you enabled?
>> And what is your kernel command line?
>>
>> Mark
> 
> Mark - what frequency are you running at? What's your CONFIG_HZ? Did
> this work earlier?
>

root@tegra-ubuntu:~# cat /proc/cpuinfo
processor       : 0
model name      : ARMv7 Processor rev 9 (v7l)
BogoMIPS        : 1993.93
Features        : swp half thumb fastmult vfp edsp vfpv3 tls
CPU implementer : 0x41
CPU architecture: 7
CPU variant     : 0x2
CPU part        : 0xc09
CPU revision    : 9
[...]

CONFIG_HZ=100

No idea whether it works before. Recently I'm facing some bugs so I
wanna use ftrace to find out the call stack easily.

> --
> Antti P Miettinen
> http://www.iki.fi/~ananaza/
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
