From: Frans Klaver <fransklaver@gmail.com>
Subject: Re: [PATCH v2 2/3] USB: ehci-tegra: fix inefficient copy of unaligned buffers
Date: Thu, 23 Apr 2015 16:31:51 +0200
Message-ID: <CAH6sp9PFE_kQn5hpXaGhn6d_WTtKZUbfS-DpDRfRCKbBj9S4fQ@mail.gmail.com>
References: <1429798012-21916-1-git-send-email-johan@kernel.org>
	<1429798012-21916-3-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429798012-21916-3-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, Alan Stern <stern@rowland.harvard.edu>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Apr 23, 2015 at 4:06 PM, Johan Hovold <johan@kernel.org> wrote:
> Make sure only to copy any actual data rather than the whole buffer,
> when releasing the temporary buffer used for unaligned non-isochronous
> transfers.
>
> Compile-tested only.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>
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
>         struct dma_aligned_buffer *temp;
> +       size_t length;
>
>         if (!(urb->transfer_flags & URB_ALIGNED_TEMP_BUFFER))
>                 return;
> @@ -311,9 +312,14 @@ static void free_dma_aligned_buffer(struct urb *urb)
>         temp = container_of(urb->transfer_buffer,
>                 struct dma_aligned_buffer, data);
>
> -       if (usb_urb_dir_in(urb))
> -               memcpy(temp->old_xfer_buffer, temp->data,
> -                      urb->transfer_buffer_length);
> +       if (usb_urb_dir_in(urb)) {
> +               if (usb_pipeisoc(urb->pipe))
> +                       length = urb->transfer_buffer_length;
> +               else
> +                       length = urb->actual_length;
> +
> +               memcpy(temp->old_xfer_buffer, temp->data, length);
> +       }
>         urb->transfer_buffer = temp->old_xfer_buffer;
>         kfree(temp->kmalloc_ptr);

Out of curiosity: any reason not to declare that length variable
inside this new compound?

Thanks,
Frans
