From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH 2/2] Add update BCT configs feature
Date: Fri, 21 Mar 2014 14:23:26 -0600
Message-ID: <532C9FBE.2080609@wwwdotorg.org>
References: <1395394886-8145-1-git-send-email-pchiu@nvidia.com> <1395394886-8145-3-git-send-email-pchiu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395394886-8145-3-git-send-email-pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/21/2014 03:41 AM, Penny Chiu wrote:
> This feature reads the BCT data from BCT or BCT with bootloader
> appended binary, updates the BCT data based on config file, then
> writes to new image file.

> diff --git a/src/cbootimage.c b/src/cbootimage.c

> @@ -131,10 +136,14 @@ process_command_line(int argc, char *argv[], build_image_context *context)
>  		case 'o':
>  			context->odm_data = strtoul(optarg, NULL, 16);
>  			break;
> +		case 'u':
> +			context->update_bct = 1;

I think rename update_bct to update_image; I believe the -u flag can be
used to update a file containing any of:

1) Just a BCT
2) A BCT, with random data appended to the end
3) A BCT, plus bootloader, plus padding
4) A BCT, plus bootloader, plus random data in between or appended to
the end.

(If the current patch doesn't cover all those cases, it probably should,
or at the very least, both (1) and (3)).

> +			num_of_filenames = 3;

s/num_of_filenames/num_filenames/

>  	/* Open the raw output file. */
> -	context.raw_file = fopen(context.image_filename,
> +	context.raw_file = fopen(context.output_image_filename,
>  		                 "w+");

Does "w+" really need to be wrapped onto a separate line?

> +		while (stats.st_size > offset) {
> +			if (!read_bct_file(&context, offset)) {
> +				process_config_file(&context, 0);
> +				e = sign_bct(&context, context.bct);
> +				if (e != 0) {
> +					printf("Signing BCT failed, error: %d.\n", e);
> +					goto fail;
> +				}
> +				write_bct_raw(&context);
> +			} else
> +				write_data_raw(&context, offset, NVBOOT_CONFIG_TABLE_SIZE);

Two things look wrong with this:

a) Presumably read_bct_file() can fail for a number of reasons:
1) I/O error
2) The data at that offset was read from the file OK, but isn't a BCT.

This loop doesn't appear to distinguish between those two cases.

b) The code appears to assume that even if read_bct_file() returns an
error, the file data has been read in and cached somewhere, so that
write_data_raw() can copy it to the output file. This is rather
implicit, and doesn't feel right. I think it would be better for the
loop to:

read a block of data into memory
if the memory is a valid BCT:
    update the BCT
write the block of data to the output file

... with file I/O and in particular, storage for "the block of data"
being owned by the loop, rather than implicitly in &context. Or at the
very least, split read_data_from_file() into a separate function from
read_bct_file(), and call data_is_valid_bct() rather than
read_bct_file() to identify the memory content.

Actually, now that I look at the implementation of write_data_raw(),
that function is not just writing but actually copying the data. So, the
function is named incorrectly. That's quite inefficient, since
read_bct_file() would have read the data once, and then write_data_raw()
reads it again to copy it. If the loop was reworked as I describe above,
this double read could be eliminated.

> +
> +			offset += NVBOOT_CONFIG_TABLE_SIZE;
...
> diff --git a/src/cbootimage.h b/src/cbootimage.h
...
> +#define NVBOOT_CONFIG_TABLE_SIZE 8192

That value isn't a constant. Different memory devices (with differnt
page/block sizes) and/or different SoCs cause BCTs to be aligned to
different boundaries. I think you might want to either replace the
#define with some dynamic function (which might involve reading the
original BCT configuration file), or at least drop the value to some
much smaller minimum alignment (say 256?), and do something a bit more
complicated to search for BCTs (e.g. read the whole file into memory,
then step through it 256 bytes at a time to find all valid BCTs).

You might want to consult with the boot ROM team to find out what the
minimum page size is, and/or whether the boot ROM hard-codes 8192, or
whether the value is dynamic based on memory type etc.

>  typedef struct build_image_context_rec
...
> +	u_int8_t update_bct;

You might want to merge the existing generate_bct field and this new
field into a tri-state enum (generate BCT, generate image, update image)

> diff --git a/src/data_layout.c b/src/data_layout.c

> +read_bct_file(struct build_image_context_rec *context, u_int32_t offset)

> +	if (context->generate_bct) {
> +		if (read_from_image(context->bct_filename,
> +			offset,
> +			&bct_storage,
> +			&bct_actual_size,
> +			file_type_bct) == 1) {
> +			printf("Error reading bct file %s.\n",
> +				context->bct_filename);
> +			goto fail;
> +		}
> +	} else {
> +		if (read_from_image(context->input_image_filename,
> +			offset,
> +			&bct_storage,
> +			&bct_actual_size,
> +			file_type_bct) == 1) {
> +			printf("Error reading image file %s.\n",
> +				context->input_image_filename);
> +			goto fail;
> +		}
>  	}

Why not pass the filename into the function, rather than putting
"application logic" into a utility function?

If this function must determine the filename, rather than having it
passed in, then the indentation of the continuation parameters should be
different from the indentation of the code block that follows. In other
words, instead of:

if (function(param,
	param,
	param))
	code

do this:

if (function(param,
		param,
		param))
	code

At least some of the parameters can be wrapped onto fewer lines.

Finally, there's no need to duplicate the entire call to
read_from_image() just to change the value of one parameter. Instead, do
this:

char *fn, *fdesc;

if (context->generate_bct) {
	fn = context->bct_filename;
	fdesc = "bct";
} else {
	fn = context->input_image_filename;
	fdesc = "image";
}
if (read_from_image(context->bct_filename, offset,
		&bct_storage, &bct_actual_size,	file_type_bct) == 1) {
	printf("Error reading %s file %s.\n", fdesc, fn);
	goto fail;
}

> +int write_bct_raw(build_image_context *context)
> +{
> +	/* write out the raw bct */
> +	if (fwrite(context->bct, 1, NVBOOT_CONFIG_TABLE_SIZE,
> +				context->raw_file) != NVBOOT_CONFIG_TABLE_SIZE)

The BCT isn't always 8192 bytes. It looks like on Tegra20 it's 4080
bytes, and on Tegra30 it's 6128 bytes.

Now, perhaps the BCT in an image is always padded out to some
sector-/page-aligned size (which as I mentioned above still might not be
8192 bytes), but if the code is updating just a BCT file not a full
image file, this code won't work correctly.

> +int write_data_raw(build_image_context *context,
> +	u_int32_t offset, u_int32_t size)

This function doesn't write some data to a file, but rather copies it
from one file to another. copy_data_raw() would be a better function
name. However, please see my comments on the main loop above; it would
be better for the whole process to be:

* Read entire input image into RAM
* Do all data manipulation in RAM
* Write entire output image to output file

I think if you do that, you can even have use the existing
write_image_file() to create the output file at the end of the
update-image process.

Perhaps both the create-new-image and update-image cases be basically
the same:

if (!context.generate_bct) {
	if (context.update_bct)
		read existing image into RAM
	else
		create empty in-RAM data structure
	process_config_file();
	write_image_file();
} else

... although process_config_file() would need to iterate over all
pre-existing BCTs it found in RAM rather than generating new BCTs; I
don't know how easy that is. I don't expect it's that hard though?

> @@ -782,6 +782,8 @@ void process_config_file(build_image_context *context, u_int8_t simple_parse)
>  	assert(context != NULL);
>  	assert(context->config_file != NULL);
>  
> +	fseek(context->config_file, 0, SEEK_SET);

This should really be part of the main loop of the update-image code;
it's not needed as part of the normal create-image handling.

> diff --git a/src/set.c b/src/set.c

> @@ -64,13 +67,22 @@ read_from_image(char	*filename,
>  		goto cleanup;
>  	}
>  
> +	if (f_type == file_type_bl) {
> +		if ((stats.st_size - offset) > MAX_BOOTLOADER_SIZE) {
> +			printf("Error: Bootloader file %s is too large.\n",
> +				filename);
> +			result = 1;
> +			goto cleanup;
> +		}
> +		*actual_size = (u_int32_t)stats.st_size;
> +	} else {
> +		if ((stats.st_size - offset) < NVBOOT_CONFIG_TABLE_SIZE) {
> +			printf("Error: Image file %s is too small.\n",
> +				filename);
> +			result = 1;
> +			goto cleanup;
> +		}
> +		*actual_size = NVBOOT_CONFIG_TABLE_SIZE;
>  	}

Again, NVBOOT_CONFIG_TABLE_SIZE isn't correct for earlier SoCs.
