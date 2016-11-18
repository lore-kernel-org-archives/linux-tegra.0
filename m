From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5] mailbox: Add Tegra HSP driver
Date: Fri, 18 Nov 2016 14:28:07 +0530
Message-ID: <CABb+yY0Fg=oDSmw_jdRvP3FbTPNkc62k9-GknPWCBE_8duzkSQ@mail.gmail.com>
References: <20161115154845.24803-3-thierry.reding@gmail.com> <20161116174133.7062-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161116174133.7062-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Nov 16, 2016 at 11:11 PM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> This driver exposes a mailbox interface for interprocessor communication
> using the Hardware Synchronization Primitives (HSP) module's doorbell
> mechanism. There are multiple HSP instances and they provide additional
> features such as shared mailboxes, shared and arbitrated semaphores.
>
> A driver for a remote processor can use the mailbox client provided by
> the HSP driver and build an IPC protocol on top of this synchronization
> mechanism.
>
> Based on work by Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.
>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Acked-by: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
