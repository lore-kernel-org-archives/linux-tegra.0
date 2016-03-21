From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] Staging: nvec: removes useless cast on a void pointer.
Date: Mon, 21 Mar 2016 15:41:47 -0400
Message-ID: <20160321194147.GA21554@kroah.com>
References: <20160313181435.GA12242@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160313181435.GA12242-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Marsh <bmarsh94-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ac100-oU9gvf+ajcSyy5GWsZ7R2qxOck334EZe@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sun, Mar 13, 2016 at 07:14:38PM +0100, Ben Marsh wrote:
> Patch to nvec.c to remove a useless cast on a void pointer.
> 
> Signed-off-by: Ben Marsh <bmarsh94-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/staging/nvec/nvec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Someone sent this before you did :(
