From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH v2 2/3] USB: ehci-tegra: fix inefficient copy of unaligned
 buffers
Date: Thu, 23 Apr 2015 10:48:58 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1504231048491.1529-100000@iolanthe.rowland.org>
References: <1429798012-21916-3-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429798012-21916-3-git-send-email-johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, 23 Apr 2015, Johan Hovold wrote:

> Make sure only to copy any actual data rather than the whole buffer,
> when releasing the temporary buffer used for unaligned non-isochronous
> transfers.
> 
> Compile-tested only.
> 
> Signed-off-by: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  drivers/usb/host/ehci-tegra.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
> index ff9af29b4e9f..4031b372008e 100644
> --- a/drivers/usb/host/ehci-tegra.c
> +++ b/drivers/usb/host/ehci-tegra.c
> @@ -304,6 +304,7 @@ struct dma_aligned_buffer {
>  static void free_dma_aligned_buffer(struct urb *urb)
>  {
>  	struct dma_aligned_buffer *temp;
> +	size_t length;
>  
>  	if (!(urb->transfer_flags & URB_ALIGNED_TEMP_BUFFER))
>  		return;
> @@ -311,9 +312,14 @@ static void free_dma_aligned_buffer(struct urb *urb)
>  	temp = container_of(urb->transfer_buffer,
>  		struct dma_aligned_buffer, data);
>  
> -	if (usb_urb_dir_in(urb))
> -		memcpy(temp->old_xfer_buffer, temp->data,
> -		       urb->transfer_buffer_length);
> +	if (usb_urb_dir_in(urb)) {
> +		if (usb_pipeisoc(urb->pipe))
> +			length = urb->transfer_buffer_length;
> +		else
> +			length = urb->actual_length;
> +
> +		memcpy(temp->old_xfer_buffer, temp->data, length);
> +	}
>  	urb->transfer_buffer = temp->old_xfer_buffer;
>  	kfree(temp->kmalloc_ptr);

Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
