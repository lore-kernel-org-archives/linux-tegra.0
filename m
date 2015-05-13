From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: mailbox: tegra xusb: undefined MFD_TEGRA_XUSB
Date: Wed, 13 May 2015 14:58:49 +0100
Message-ID: <55535899.5060209@nvidia.com>
References: <CAD3Xx4JfF_HCkhk7k+05KD+F+5cXGcOLZ1eBu0nyCB_JBk1fYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD3Xx4JfF_HCkhk7k+05KD+F+5cXGcOLZ1eBu0nyCB_JBk1fYw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Valentin Rothberg <valentinrothberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, hengelein Stefan <stefan.hengelein-d40JDW7QUjc@public.gmane.org>, Andreas Ruprecht <andreas.ruprecht-d40JDW7QUjc@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Valentin,

On 13/05/15 14:22, Valentin Rothberg wrote:
> Hi Andrew,
> 
> your commit b1f10002b00a ("mailbox: Add NVIDIA Tegra XUSB mailbox
> driver") is in today's linux-next tree (i.e., next-20150513) and it
> adds the following lines:
> 
> +config TEGRA_XUSB_MBOX
> +       tristate "NVIDIA Tegra XUSB Mailbox"
> +       depends on MFD_TEGRA_XUSB
> 
> At the current state, the dependency is always false since the option
> MFD_TEGRA_XUSB is not defined in Kconfig, and the added driver cannot
> be compiled.
> 
> Is there a patch queued somewhere to add this missing option?

This is part of this series [1] which has the other patches. I don't
believe the others in the series have been queued yet.

Cheers
Jon

[1] https://lkml.org/lkml/2015/5/4/574
