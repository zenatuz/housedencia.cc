# housedencia.cc DNS Custom List

This repository hosts a custom DNS list used with Pi-hole and Unbound for the `housedencia.cc` domain. The list is published online via Vercel and can be fetched programmatically.

## Repository Structure

```
.
├── README.md
├── public
│   ├── custom.list        # The DNS custom hosts list served publicly
│   └── index.html         # Simple landing page to avoid 404 errors
├── scripts
│   └── update-custom-list.sh  # Script to download and update the custom list locally
└── vercel.json            # Vercel configuration file for deployment
```

## Usage

- The `custom.list` is available at:  
  `https://housedencia-cc.vercel.app/custom.list`

- You can use this URL in your Pi-hole or Unbound configuration to load custom DNS entries.

- To update the local copy of the list, run the provided script:

  ```bash
  ./scripts/update-custom-list.sh
  ```

## Deployment

- The site is automatically deployed on [Vercel](https://vercel.com) using the configuration in `vercel.json`.

- Only the contents of the `public/` directory are served publicly.

## Contributing

Feel free to submit issues or pull requests to update or improve the `custom.list` or any part of the deployment.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

_Maintained by zenatuz_
