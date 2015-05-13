From: Valentin Rothberg <valentinrothberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: mailbox: tegra xusb: undefined MFD_TEGRA_XUSB
Date: Wed, 13 May 2015 16:00:19 +0200
Message-ID: <CAD3Xx4LdjCg6Kjr0HvxNKWTeaWp9RYziBpUdPWb5Ac4V4LPHAg@mail.gmail.com>
References: <CAD3Xx4JfF_HCkhk7k+05KD+F+5cXGcOLZ1eBu0nyCB_JBk1fYw@mail.gmail.com>
 <55535899.5060209@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55535899.5060209-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, hengelein Stefan <stefan.hengelein-d40JDW7QUjc@public.gmane.org>, Andreas Ruprecht <andreas.ruprecht-d40JDW7QUjc@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Jon,

thanks for your answer and the link.

Kind regards,
 Valentin

On Wed, May 13, 2015 at 3:58 PM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Hi Valentin,
>
> On 13/05/15 14:22, Valentin Rothberg wrote:
>> Hi Andrew,
>>
>> your commit b1f10002b00a ("mailbox: Add NVIDIA Tegra XUSB mailbox
>> driver") is in today's linux-next tree (i.e., next-20150513) and it
>> adds the following lines:
>>
>> +config TEGRA_XUSB_MBOX
>> +       tristate "NVIDIA Tegra XUSB Mailbox"
>> +       depends on MFD_TEGRA_XUSB
>>
>> At the current state, the dependency is always false since the option
>> MFD_TEGRA_XUSB is not defined in Kconfig, and the added driver cannot
>> be compiled.
>>
>> Is there a patch queued somewhere to add this missing option?
>
> This is part of this series [1] which has the other patches. I don't
> believe the others in the series have been queued yet.
>
> Cheers
> Jon
>
> [1] https://lkml.org/lkml/2015/5/4/574
