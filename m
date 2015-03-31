From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 1/3] gpu: host1x: Reduce host1x job allocation size
Date: Tue, 31 Mar 2015 15:29:45 +0900
Message-ID: <CAAVeFuLZOJdOtpuSqdRzGa0rK3WZWURz-pn2tXhqTv58J0R_NA@mail.gmail.com>
References: <1425606712-15986-1-git-send-email-davidu@nvidia.com>
 <0e36c4295adc4f2daae9715cd0dde87d@HQMAIL102.nvidia.com> <CAAVeFuK4NOrfCcX846rgPdViR6Ur4pSrrVihiV7KP1kRf15kdw@mail.gmail.com>
 <2253e92cd45c4b33913a45011c4ce823@HQMAIL102.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2253e92cd45c4b33913a45011c4ce823-wO81nVYWzR5xWE4FnwvcdlaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 24, 2015 at 4:39 AM, David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
>> -----Original Message-----
>> From: Alexandre Courbot [mailto:gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
>> Sent: Monday, March 23, 2015 12:09 AM
>> To: David Ung
>> Cc: airlied-cv59FeDIM0c@public.gmane.org; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
>> thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org; Arto Merilainen;
>> Terje Bergstrom
>> Subject: Re: [PATCH V2 1/3] gpu: host1x: Reduce host1x job allocation size
>>
>> The series looks ok to me, the only problem I see is that we are lacking
>> means to thoroughly test host1x patches across all the supported Tegra
>> chips.
>>
>> Could you detail what kind of testing this patch series has undergone, and
>> which chips/boards have been tested?
>
> Tested the host1x channel tests for T132 on A44.
> Also ran Paul's EIMT set up which only tests booting kernel to console for T20/T30/T114/T124 and QEMU

Thierry, what do you think?

I know we are lacking proper testing infrastructure for host1x, but
these patches really looks harmless to me.
