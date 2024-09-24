Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC401AAE0F;
	Tue, 24 Sep 2024 14:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727189048; cv=none; b=tt+wcZhFvXcvhRP3cyhn9f1TOVMBsAikVzrCztk8dJbTJ5AGe0uRzKVBP0LSrI2wvenT6cVtGZuHOYsdZpy+1EC0hnp3YGj97qWLygFQU/aBybwcQdww06ACpQW81QNmlNg2PAaOOTkB53yLOwQGSXho6riLUtMuZ7rgaxmIiOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727189048; c=relaxed/simple;
	bh=v39vkI+N9c/ocMSiE3cqjymQKamMcbwCN/N72hQr06g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T0iqE/iTbQmr3TWaqb3lV8Ui1yW3AOBaf/3BpKhz3Y4vcsvC0kk42hIzpll/0Wake7ViAwjKRmMMlQXoBolfHReQpcxvLpi9sH2KzJgYHlZvetZ7FdHEM8MPBOwYz/CT1iKF/H3lghzhBGB3Yw6q4kpCZ3VlY4CT9i9fYuJ7dLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=THHXGDAv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="THHXGDAv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 728F5C4CEC4;
	Tue, 24 Sep 2024 14:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727189047;
	bh=v39vkI+N9c/ocMSiE3cqjymQKamMcbwCN/N72hQr06g=;
	h=Date:From:To:Cc:Subject:From;
	b=THHXGDAv02dmr0WPaXl3asZcHHGN9wKE/MCdzTTlzgYOKdB0l1KdGz9d8evOev63x
	 mpFf17dwNEQVHFY8a4PZWD3LdMm9ob1p7wDNxxN3XtXVlSrkDY+ufO2jTiFsfytCBy
	 Y9hott3gUiGWW1k2XGYKrIXk0xtFw8doM8Eo50Bk=
Date: Tue, 24 Sep 2024 10:44:06 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, 
	helpdesk@kernel.org
Subject: Bouncing maintainer: Peter De Schrijver
Message-ID: <20240924-dachshund-of-optimal-politeness-840d3f@lemur>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

I'm reaching out to co-maintainers of the following subsystems:

  - TEGRA CLOCK DRIVER

The email address for one of your maintainers is bouncing:

  M: Peter De Schrijver <pdeschrijver@nvidia.com>

There are several possible courses of action:

1. If you know the new email address for the maintainer, please ask them to
   submit a patch for MAINTAINERS and .mailmap files.

2. If this maintainer stepped away from their duties, or if co-maintainers are
   equally unable to reach them via any other means, please submit a patch to
   MAINTAINERS to remove their M: entry.

The goal is to have no bouncing M: entries in the maintainers file, so please
follow up as soon as you have decided on the correct course of action.

Best regards,
--
Konstantin Ryabitsev
Linux Foundation

bugspray track
