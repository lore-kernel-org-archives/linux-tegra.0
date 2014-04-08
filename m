From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH V2 5/5] Add update BCT configs feature
Date: Tue, 08 Apr 2014 15:27:20 -0600
Message-ID: <534469B8.9010606@wwwdotorg.org>
References: <1396967422-6018-1-git-send-email-pchiu@nvidia.com> <1396967422-6018-6-git-send-email-pchiu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396967422-6018-6-git-send-email-pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/08/2014 08:30 AM, Penny Chiu wrote:
> This feature reads the BCT data from BCT or BCT with bootloader
> appended binary, updates the BCT data based on config file, then
> writes to new image file.

> diff --git a/src/cbootimage.h b/src/cbootimage.h

> +#define NVBOOT_CONFIG_TABLE_SIZE_MAX 8192
> +#define NVBOOT_CONFIG_TABLE_SIZE_T20 4080
> +#define NVBOOT_CONFIG_TABLE_SIZE_T30 6128
> +#define NVBOOT_CONFIG_TABLE_SIZE_T114 8192
> +#define NVBOOT_CONFIG_TABLE_SIZE_T124 8192

It might at least be nice in this series to add a compile-time-assert to
nvboot_bct_tNN.h to validate that those sizes are OK

> diff --git a/src/cbootimage.c b/src/cbootimage.c

> @@ -190,18 +203,66 @@ main(int argc, char *argv[])

> +		while (stats.st_size > offset) {
> +			/* Read a block of data into memory */
> +			if (read_from_image(context.input_image_filename, offset, bct_size,
> +					&data_block, &actual_size, file_type_bct)) {
...
> +			offset += bct_size;
> +		}

I don't think that handles multiple bootloaders in the image correctly.
bct_size isn't always aligned to the block size of the memory device,
whereas copies of the BCT are. This probably won't be an issue for
Tegra114/124, but for Tegra20/30, the code needs to read the memory
block by block, rather than in BCT-sized chunks.

I'd be fine for now with doing one of the following if determining the
real memory block size is too complicated:

a) Disallow -u on Tegra20/30 (or even anything other than Tegra124).

b) Always read 8KB chunks, since that is the nearest power of 2 above
the BCT size on all platforms.

Related, what happens in the memory block size is less than the size of
a BCT; the code really should read a BCT's worth of data (e.g. 8KB)
starting at each block-sized offset into the file (e.g. 2KB). That's why
I originally suggested reading the entire image into memory (or mmap'ing
it) and updating it in one pass, since that decouples the file IO from
locating the BCTs within the image. Still, we can fix this up later.

> diff --git a/src/data_layout.c b/src/data_layout.c

>  read_bct_file(struct build_image_context_rec *context)
>  {
>  	u_int8_t  *bct_storage; /* Holds the Bl after reading */
> -	u_int32_t  bct_actual_size; /* In bytes */
> +	u_int32_t bct_actual_size; /* In bytes */

That seems like an unrelated change.

> +int write_data_block(FILE *fp, u_int32_t offset, u_int32_t size, u_int8_t *buffer)
> +{
> +	if (fseek(fp, offset, 0))
> +		return -1;
> +
> +	fwrite(buffer, 1, size, fp);
> +	return 0;
> +}

It'd be nice to validate that fwrite() was successful. return fwrite(...);?

> +int get_bct_size_from_image(build_image_context *context)
> +{
> +	u_int8_t buffer[NVBOOT_CONFIG_TABLE_SIZE_MAX];
> +	u_int32_t bct_size = 0;
> +	FILE *fp;
> +
> +	fp = fopen(context->input_image_filename, "r");
> +	if (!fp)
> +		return ENODATA;
> +
> +	if (fread(buffer, 1, NVBOOT_CONFIG_TABLE_SIZE_MAX, fp)) {

Error-handling for read() would be nice here too.
